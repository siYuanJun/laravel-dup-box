<?php

namespace App\Admin\Controllers;

use App\Models\Column;
use App\Models\Moban;
use Dcat\Admin\Admin;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Layout\Row;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Models\Permission;
use Dcat\Admin\Tree;

class ColumnController extends AdminController
{
//    public function index(Content $content)
//    {
//        return $content->header(admin_trans_label())
//            ->body(function (Row $row) {
//                $tree = new Tree(new Column);
//                $tree->branch(function ($branch) {
//                    if($branch['pic']) {
//                        $src = "/uploads/{$branch['pic']}";
//                        $logo = "<img src='{$src}' style='max-width:30px;max-height:30px' class='img'/>";
//                        return "{$branch['id']} - {$branch['title']} $logo";
//                    } else {
//                        return "{$branch['id']} - {$branch['title']}";
//                    }
//                });
//                $row->column(12, $tree);
//            });
//    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Column(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('title')->tree();
            $grid->column('moban_id');
            $grid->column('order')->orderable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->equal('parent_id')->select(Column::selectOptions());
            });

//            $grid->showQuickEditButton();
            $grid->enableDialogCreate();
            $grid->disableBatchDelete();
            $grid->disableViewButton();
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
                $form->select('parent_id')->options(Column::selectOptions())->required();
                $form->text('title')->required();
                $form->select('moban_id')->options(Moban::selectOptions());
                $form->number('order');
                $form->image('pic');
            });
            $form->tab('内容信息', function ($form) {
                $form->ckeditor('content', '内容');
            });
        });
    }
}
