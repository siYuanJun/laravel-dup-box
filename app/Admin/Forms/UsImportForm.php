<?php

namespace App\Admin\Forms;

use App\Imports\UsImport;
use Dcat\Admin\Widgets\Form;
use Dcat\EasyExcel\Excel;

class UsImportForm extends Form
{
    /**
     * Handle the form request.
     *
     * @param array $input
     *
     * @return mixed
     */
    public function handle(array $input)
    {
        $file = $input['file'];
        if (empty($file)) {
            return $this->response()->error('请选择并上传正确的 Excel 文件');
        }
        $file = storage_path("/app/public/" . $file);
        $data = Excel::import($file)->toArray();
        $temp = [];
        foreach ($data[0] as $value) {
            $temp = array_merge($temp, $value);
        }
        if (empty($temp)) {
            return $this->response()->error("上传文件为空。");
        }
        $temp = array_unique($temp);

        foreach ($temp as $key => $value) {
//            dump($key, $value);
        }

        return $this->response()->success("导入成功")->refresh();
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->file('file', 'Excel 文件');
    }

    /**
     * The data of the form.
     *
     * @return array
     */
    public function default()
    {
        return [
        ];
    }
}
