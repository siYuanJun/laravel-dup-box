<?php

namespace App\Admin\Controllers;

use App\Models\Column;
use Dcat\Admin\Admin;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Models\Permission;

class ColumnController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Column(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('parent_id');
            $grid->column('title')->tree();
            $grid->column('order')->orderable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');

            });

            $grid->showQuickEditButton();
            $grid->enableDialogCreate();
//            $grid->disableBatchDelete();
//            $grid->disableViewButton();
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
        return Show::make($id, new Column(), function (Show $show) {

        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Column(), function (Form $form) {
            $form->tab('基本信息', function ($form) {
                $form->select('parent_id')->options(Column::selectOptions());
                $form->text('title');
                $form->number('order');
            });
            $form->tab('动态信息', function ($form) {
//                $form->ckeditor('content', '内容');
            });
        });
    }
}
