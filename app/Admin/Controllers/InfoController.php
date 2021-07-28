<?php

namespace App\Admin\Controllers;

use App\Models\Column;
use App\Models\Ext;
use App\Models\Info;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class InfoController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(Info::with(['column']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('column.title', '分类名称')->label('blue');
            $grid->column('title')->limit(30);
            $grid->column('subtitle');
            $grid->column('author');
            $grid->column('source');
            $grid->column('edit_name');
            $grid->column('linkurl');
            $grid->column('hits');
            $grid->column('pic')->image("", 30);
            $grid->column('property')->checkbox(Ext::selectOptions(2));
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
            });
            $grid->fixColumns(3, -2);
            $grid->filter(function ($filter) {
                $filter->like('title');
                $filter->like('subtitle');
                $filter->like('author');
                $filter->equal('classid')->select(Ext::selectOptions());
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
        return Show::make($id, new Info(), function (Show $show) {
            $show->field('id');
            $show->field('classid');
            $show->field('title');
            $show->field('subtitle');
            $show->field('author');
            $show->field('source');
            $show->field('edit_name');
            $show->field('linkurl');
            $show->field('seotitle');
            $show->field('keyword');
            $show->field('description');
            $show->field('hits');
            $show->field('pic');
            $show->field('img');
            $show->field('property');
            $show->field('content');
            $show->field('filepath');
            $show->field('ordernum');
            $show->field('videourl');
            $show->field('created_at');
            $show->field('updated_at');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Info(), function (Form $form) {
            $form->tab('基本', function ($form) {
                $form->column(6, function (Form $form) {
                    $form->select('classid')->options(Column::selectOptions());
                    $form->text('title');
                    $form->text('subtitle');
                    $form->text('author');
                    $form->text('source');
                    $form->text('edit_name');
                    $form->image('pic');
                });
                $form->column(6, function (Form $form) {
                    $form->multipleSelect('property')->options(Ext::selectOptions(2));
                    $form->text('seotitle');
                    $form->textarea('keyword');
                    $form->textarea('description');
                });
            });
            $form->tab('扩展', function ($form) {
                $form->number('hits');
                $form->url('linkurl');
                $form->image('img');
                $form->file('filepath');
                $form->number('ordernum');
                $form->url('videourl');
            });
            $form->tab('内容', function ($form) {
                $form->editor('content');
            });
        });
    }
}
