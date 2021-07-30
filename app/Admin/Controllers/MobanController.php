<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Moban;
use App\Models\Ext;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class MobanController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(Moban::with(['extTing']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('extTing.title', "模型");
            $grid->column('file_name');
            $grid->column('file_page');

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');

            });
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
        return Show::make($id, new Moban(), function (Show $show) {
            $show->field('id');
            $show->field('dir_id');
            $show->field('file_name');
            $show->field('file_page');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Moban(), function (Form $form) {
            $form->select('dir_id')->options(Ext::selectOptions(20));
            $form->text('file_name')->help("请填写，中文模版名称");
            $form->text('file_page')->help("请填写，纯小写英文页面名称");
        });
    }
}
