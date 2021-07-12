<?php

namespace App\Actions;

use App\Imports\UsImport;
use Dcat\Admin\Actions\Action;
use Dcat\Admin\Admin;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Excel;

class ImportWorker extends Action
{

    public $name = '绑定用户';

    protected $selector = '.import-post';

    public function handle(Request $request)
    {
        $file = $request->file('file');
        $cid = $request->input('cid');

        if ($cid && $file && $file->isValid()) {
            $data = Excel::toArray(new UsImport(), $file);
            $temp = [];
            foreach ($data[0] as $value) {
                $temp = array_merge($temp, $value);
            }
            if (empty($temp)) {
                return $this->response()->error("上传文件为空。");
            }
            $temp = array_unique($temp);
            foreach ($temp as $value) {
//                WorkerBind::bindWorker($cid,$value);
            }
            return $this->response()->success("绑定成功")->refresh();
        }
        return $this->response()->error('请选择并上传正确的 Excel 文件');
    }

    public function form()
    {
        $user = Admin::user();
        $platId = $user->cid ? $user->cid : 0;
        if (!$platId) {
//            $this->select("cid","甲方")->options(Company::getAllCompany());
        } else {
            $this->hidden("cid")->value($platId);
        }
        $this->file('file', 'Excel 文件（录入需要绑定人员的身份证号）');
    }


    public function html()
    {
        return <<<HTML
        <button class="btn btn-success import-post"><i class="fa fa-plus"></i> 绑定人员</button>
HTML;
    }
}
