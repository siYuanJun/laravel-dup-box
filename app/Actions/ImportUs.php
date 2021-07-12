<?php

namespace App\Actions;

use App\Admin\Forms\UsImportForm;
use App\Imports\UsImport;
use Dcat\Admin\Actions\Action;
use Dcat\Admin\Admin;
use Dcat\Admin\Widgets\Modal;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Excel;
use Dcat\Admin\Grid\Tools\AbstractTool;

class ImportUs extends Action
{
    public $name = '导入用户';

    public function render()
    {
        return Modal::make()
            ->lg()
            ->title($this->name)
            ->body(UsImportForm::make())
            ->button('<button class="btn btn-success import-post"><i class="fa fa-plus"></i> ' . $this->name . '</button>');
    }

}
