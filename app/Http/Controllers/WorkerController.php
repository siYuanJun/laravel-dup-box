<?php

namespace App\Http\Controllers;

use App\Models\Apply;
use App\Models\Bankcard;
use App\Models\ChinaArea;
use App\Models\Collect;
use App\Models\Company;
use App\Models\Contract;
use App\Models\Fadada;
use App\Models\Information;
use App\Models\Omit;
use App\Models\OperateScreenshot;
use App\Models\Paycost;
use App\Models\Signlog;
use App\Models\Task;
use App\Models\Worker;
use App\Models\WorkerBind;
use App\Models\Worklog;
use App\Services\FaDaDaApi;
use App\Services\TencentApi;
use Encore\Admin\Grid\Filter\In;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\DB;
use RedisDb;

class WorkerController extends Controller
{

    const PageSize = 20;

    /**
     * 下拉选项
     * @return array
     */
    public function selectList()
    {
        $status = config('status');
        $status["marry"] = [
            "0" => "未婚",
            "1" => "已婚"
        ];
        array_unshift($status["edu"], "请选择您的学历");
        array_unshift($status["polity"], "请选择您的政治面貌");
        array_unshift($status["settle_type"], "请选择");
        array_unshift($status["industry"], "请选择");
        return reply("ok", 0, $status);
    }


    public function getUserInfo(Request $request)
    {
        $userInfo = $request->userInfo;
//        $data = Worker::query()->find($userInfo->id);
//        $data->backCard = Bankcard::query()->where("wid", $userInfo->id)->where("status", 0)->first();
        return reply($userInfo);
    }

    /**
     * 完善信息
     * @param Request $request
     */
    public function saveUserInfo(Request $request)
    {
        $userInfo = $request->userInfo;
        $worker = Worker::query()->find($userInfo->id);
        $worker->name = $request->input("name") ?? "";
        $worker->sex = $request->input("sex") ?? "";
        $worker->age = $request->input("age") ?? "";
        $worker->home = $request->input("home") ?? "";
        $worker->edu = $request->input("edu") ?? "";
        $worker->polity = $request->input("polity") ?? "";
        $worker->marry = $request->input("marry") ?? "";
        $res = $worker->update();
        if (!$res) {
            return reply("系统错误", 1);
        }
        return reply();
    }

    /**
     * 实名认证
     * @param Request $request
     */
    public function verifyCards(Request $request)
    {
        $userInfo = $request->userInfo;
        $name = $request->input("name");
        $idcard = $request->input("idcard");

        if (!$name || !$idcard) {
            return reply("参数错误",1);
        }

        $search = Worker::query()->where("idcards",$idcard)->first();
        if ($search) {
            return reply("该身份证号已被绑定",2);
        }

        $res = TencentApi::VerifyIdCard($name, $idcard);
        if ($res['code'] != 0) {
            return $res;
        }
        $worker = Worker::query()->find($userInfo->id);
        $worker->name = $name;
        $worker->idcards = $idcard;
        $res = $worker->update();
        if (!$res) {
            return reply("绑定失败", 3);
        }
        //根据身份证绑定甲方
        WorkerBind::bindCompany($idcard);
        return reply();
    }

    /**
     * 收藏
     * @param Request $request
     */
    public function collect(Request $request)
    {
        $userInfo = $request->userInfo;
        $tids = $request->input("tids");
        if (empty($tids)) {
            return reply("参数错误", 1);
        }
        $tidArr = explode(",", $tids);
        foreach ($tidArr as $value) {
            $collect = Collect::query()->where(['tid' => $value, 'wid' => $userInfo->id])->first();
            if (empty($collect)) {
                Collect::query()->insert(["wid" => $userInfo->id, "tid" => $value]);
            } else {
                Collect::query()->where(['tid' => $value, 'wid' => $userInfo->id])->delete();
            }
        }
        return reply();
    }

    /**
     * 收藏列表
     * @param Request $request
     */
    public function collectList(Request $request)
    {
        $uid = $request->userInfo->id;
        $pageSize = $request->input("pageSize");
        $status = $request->input("status") ?? 0;


        //接单列表
        $tids = Apply::query()->where('wid', $uid);
        if ($status == 2) {
            $tids->where("status", 0);
            $tids->where("settle", 0);
        }
        if ($status == 3) {
            $tids->where("status", 1);
            $tids->where("settle", 0);
        }
        if ($status == 4) {
            $tids->where("status", 1);
            $tids->where("settle", 1);
        }
        $tidRes = $tids->select("tid")->get();
        $tidRes = $tidRes->toArray();
        $tidArr = array_column($tidRes, "tid");

        $data = DB::table("collect")
            ->leftJoin("task", "task.id", "=", "collect.tid")
            ->select("task.id as tid", "task.title as taskName","task.company_id as companyId", "task.name as postName", "task.settle_type as settleType", "task.settle_price as settlePrice","task.settle_price1 as settlePrice1",
                "task.province", "task.city", "task.area", "task.address", "task.tags", "task.num as totalNum", "task.start_time as startTime", "task.end_time as endTime")
            ->where("collect.wid",$uid);

        if (in_array($status,[2,3,4])) {
            $data->whereIn("task.id", $tidArr);
        }
        if ($status == 1) {
            $data->whereNotIn("task.id", $tidArr);
        }

        $res = $data->paginate($pageSize ?? self::PageSize);

        foreach ($res->items() as $value) {
            $value->address = ChinaArea::getFullName($value) . $value->address;
            unset($value->province);
            unset($value->city);
            unset($value->area);
            $collect = Collect::query()->where(['wid' => $uid, 'tid' => $value->tid])->first();
            $value->isCollect = !empty($collect) ? 1 : 0;

            $value->applyNum = Apply::getNum($value->tid);
            $value->dayNum = getDiffDayNum($value->startTime, $value->endTime);
            $value->startTime = date("Y.m.d", strtotime($value->startTime));
            $value->endTime = date("Y.m.d", strtotime($value->endTime));
            $value->applyStatus = Apply::getApplyStatus($value->tid, $uid);

            $value->companyName = Company::getCompnayName($value->companyId);
        }
        return reply([
            "current_page" => $res->currentPage(),
            "items" => $res->items(),
            "total" => $res->total(),
            "pageSize" => $pageSize ?? self::PageSize
        ]);
    }

    /**
     * 获取开户行
     * @param Request $request
     */
    public function getBankAccount(Request $request)
    {
        $bankCard = $request->input("bankCard");
        if (!$bankCard) {
            return reply("参数错误", 1);
        }
        return TencentApi::getBankNameByCard($bankCard);
    }

    /**
     * 发送短信
     * @param Request $request
     */
    public function sendSms(Request $request)
    {
        $phone = $request->input("phone");
        if (!verifyPhone($phone)) {
            return reply("手机号错误", 1);
        }
        $code = rand(1000, 9999);
        $res = TencentApi::sendSms("924914", ["+86" . $phone], [(string)$code]);
        if ($res['code'] != 0) {
            return $res;
        }
        RedisDb::setex("sms_" . $phone, 300, $code);
        return reply();
    }


    /**
     * 银行三要素验证
     * @param Request $request
     */
    public function verifyBankCard(Request $request)
    {
        $userInfo = $request->userInfo;
        $name = $request->input("name");
        $bankCard = $request->input("bankCard");

        if (!$bankCard || !$name) {
            return reply("参数错误", 1);
        }
        $card = Bankcard::query()->where([
            "wid" => $userInfo->id,
            "card" => $bankCard,
            "status" => 0
        ])->first();

        if (!empty($card)) {
            return reply("银行已绑定", 1);
        }
        return TencentApi::VerifyBankCard3($userInfo->idcards, $name, $bankCard);
    }

    /**
     * 绑定银行卡
     * @param Request $request
     */
    public function bindBankCard(Request $request)
    {
        $userInfo = $request->userInfo;
        $name = $request->input("name");
        $bankCard = $request->input("bankCard");
        $bankName = $request->input("bankName");
        $phone = $request->input("phone");
        $code = $request->input("code");

        if (!$name || !$bankCard || !$bankName || !$phone || !$code) {
            return reply("参数错误", 1);
        }

        //验证四要素
        $resCard = TencentApi::VerifyBankCard($name, $userInfo->idcards, $phone, $bankCard);
        if ($resCard['code'] != 0) {
            return $resCard;
        }

        //验证手机号验证码
        $pcode = RedisDb::get("sms_" . $phone);
        if ($code != $pcode) {
            return reply("手机验证码错误", 1);
        }
        RedisDb::del("sms_" . $phone);

        $update = Worker::query()->find($userInfo->id);
        $update->name = $name;
        $update->update();

        //更改其他银行的状态
        Bankcard::where("wid", $userInfo->id)->update(['status' => 1]);
        //新增银行卡
        $card = new Bankcard();
        $card->wid = $userInfo->id;
        $card->card = $bankCard;
        $card->phone = $phone;
        $card->unit = $bankName;
        $card->save();

        return reply();
    }
}
