<?php

namespace App\Actions;

use App\Admin\Repositories\Us;
use Dcat\Admin\Grid\RowAction;
use Dcat\Admin\Admin;

class DisableAction extends RowAction
{
    public $name = '禁用';

    public function handle()
    {
        $id = $this->row->id;
        Us::query()->find($id)->update(["status" => 1]);
        return $this->response()->success("ok")->refresh();
    }

    public function dialog()
    {
        $this->confirm('确定禁用？');
    }

}
