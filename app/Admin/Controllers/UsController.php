<?php

namespace App\Admin\Controllers;

use App\Actions\ImportWorker;
use App\Actions\LoadWorkerExcel;
use App\Admin\Repositories\Us;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class UsController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Us(), function (Grid $grid) {
//            $cid = Admin::user()->cid;
//
//            if ($cid) {
//                $grid->model()->where("company_id","=",$cid);
//            }

            $grid->fixColumns(3, -2);
            $grid->model()->orderByDesc("id");

            $grid->column('id')->sortable();
            $grid->column('phone');
//            $grid->avatar('image');
            $grid->column('name');

//            $grid->column('name', "姓名")->expand(function ($model) {
//                $bankCard = Bankcard::query()->where("wid",$this->id)->where("status",0)->first();
//                $table = [];
//                $table[] = [
//                    "card" => $bankCard->card ?? "--",
//                    "unit" => $bankCard->unit ?? "--",
//                    "phone" => $bankCard->phone ?? "--"
//                ];
//                return new Table(['银行卡号', '所属银行', '手机号'], $table);
//            });

//            $grid->column('company_id')->display(function () {
//                return Company::getCompnayName($this->company_id);
//            });
            $grid->column('sex')->display(function () {
                return getStatus($this->sex,"sex");
            });
            $grid->column('idcards');
            $grid->column('age');
            $grid->column('edu')->display(function () {
                return getStatus($this->edu,"edu");
            });
            $grid->column('home');
            $grid->column('polity')->display(function () {
                return getStatus($this->polity,"polity");
            });
            $grid->column('marry')->display(function () {
                return getStatus($this->marry,"marry");
            });
            $grid->column('create_time');

            $grid->column('status')->display(function () {
                return getStatus($this->status,"default");
            })->label([
                "0" => 'default',
                "1" => 'danger'
            ]);

            $grid->disableCreateButton();
//            $grid->disableExport();

            $grid->filter(function($filter){
                $filter->disableIdFilter();
                $filter->like('name');
                $filter->like('phone');
            });

            $grid->tools(function (Grid\Tools $tools) {
//                $tools->append(new LoadWorkerExcel());
//                $tools->append(new ImportWorker());
            });

//            if($cid){
//                $grid->disableActions();
//            } else {
//                $grid->actions(function ($actions) use ($cid) {
//                    $actions->disableDelete();
//                    $actions->disableView();
//                    $actions->disableEdit();
//                    $row = $actions->row;
//                    if ($row->status == 0) {
//                        $actions->add(new DisableAction());
//                    } else {
//                        $actions->add(new AbleAction());
//                    }
//                });
//            }

            $grid->disableRowSelector();

        });
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        return Show::make($id, new Us(), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('sex');
            $show->field('age');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Us(), function (Form $form) {
            $form->text('name')->required();
            $form->text('phone')->required()->rules(function ($form) {
                // 如果不是编辑状态，则添加字段唯一验证
                if ($form->isCreating()) {
                    return 'unique:worker';
                }
            },["已存在"]);
            $form->text('idcards')->required();
            $form->radio('sex')->options(config("status.sex"));
            $form->number('age')->max(100)->min(1)->required();
            $form->select('edu')->options(config("status.edu"))->required();
            $form->text('home')->required();
            $form->select('polity')->options(config("status.polity"))->required();
            $form->radio('marry')->options(config("status.marry"))->required();

            $form->footer(function ($footer) {
                $footer->disableReset();
            });
        });
    }
}
