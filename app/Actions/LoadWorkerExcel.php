<?php

namespace App\Actions;

use Dcat\Admin\Actions\Action;
use Maatwebsite\Excel\Excel;

class LoadWorkerExcel extends Action
{
    public function html()
    {
        return <<<HTML
        <a class="btn btn-primary" target="_blank" href="/IDcard.xlsx"><i class="fa fa-download"></i>下载导入模版</a>
HTML;
    }
}
