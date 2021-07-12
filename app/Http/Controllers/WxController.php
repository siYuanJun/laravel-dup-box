<?php

namespace App\Http\Controllers;

use App\Models\Us;
use App\Services\Token;
use Illuminate\Http\Request;
use RedisDb;
use App\Services\WXBizDataCrypt;

/**
 * Class WxController
 * @package App\Http\Controllers
 */
class WxController extends Controller
{

    const WXAPPID = "wx53166646d181fa2e";
    const WXAPPSECRET = "0caa34ba029fdbeb1e2d1f30385f71c1";
    const WXCODESESSIONURL = "https://api.weixin.qq.com/sns/jscode2session";


    /**
     * 微信小程序登录、授权
     * @param Request $request
     */
    public function login(Request $request)
    {
        $code = $request->input("code");
        $encryptedData = $request->input("encryptedData");
        $iv = $request->input("iv");

        if (empty($code)) {
            return reply("参数错误！", 1);
        }

        $params = [
            'appid' => self::WXAPPID,
            'secret' => self::WXAPPSECRET,
            'js_code' => $code,
            'grant_type' => "authorization_code"
        ];

        $url = self::WXCODESESSIONURL . "?" . http_build_query($params);

        //登录校验
        $obj = json_decode(file_get_contents($url), true);
        if (isset($obj['errcode'])) {
            return reply("小程序登录校验失败", 2, $obj);
        }
        $openid = $obj['openid'];
        $session_key = $obj['session_key'];

        //获取用户信息
        $num = Us::query()->where("openid", $openid)->count();
        if ($num == 0) {
            $newWorker = new Us();
            $newWorker->openid = $openid;
            $newWorker->save();
        }

        $where = [];
        if (!empty($encryptedData) && !empty($iv)) {
            $pc = new WXBizDataCrypt(self::WXAPPID, $session_key);
            $errCode = $pc->decryptData($encryptedData, $iv, $data);
            if ($errCode != 0) {
                return reply("加密数据错误！" . $errCode, 3);
            }
            $data = json_decode($data, true);

            if (isset($data['nickName'])) {
                $where['nickname'] = $data['nickName'];
                $where['image'] = $data['avatarUrl'];
            }
            if (isset($data['phoneNumber'])) {
                $where['phone'] = $data['phoneNumber'];
            }
        }

        Us::query()->where("openid", $openid)->update($where);

        $worker = Us::query()->where("openid", $openid)->first();

        $token = Token::createToken([
            'openid' => $openid,
            'session_key' => $session_key,
            'userInfo' => $worker->toArray()
        ]);

        return reply(['token' => $token, "userInfo" => $worker]);
    }


}
