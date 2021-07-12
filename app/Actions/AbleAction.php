<?php

namespace App\Actions;

use App\Admin\Repositories\Us;
use Dcat\Admin\Grid\RowAction;

class AbleAction extends RowAction
{
    public $title = '恢复';

    public function handle()
    {
        $id = $this->row->id;
        Us::query()->find($id)->update(["status" => 0]);
        return $this->response()->success("ok")->refresh();
    }

    public function dialog()
    {
        $this->confirm();
    }

}
