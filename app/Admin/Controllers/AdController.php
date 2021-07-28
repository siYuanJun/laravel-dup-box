<?php

namespace App\Admin\Controllers;

use App\Models\Ad;
use App\Models\Ext;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Support\Helper;

class AdController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(Ad::with(['extTing']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('title');
            $grid->column('code');
            $grid->column('extTing.title', '类型');
            $grid->column('ordernum');
            $grid->column('pic')->image();
            $grid->column('linkurl');

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
        return Show::make($id, new Ad(), function (Show $show) {
            $show->field('id');
            $show->field('title');
            $show->field('code');
            $show->field('type');
            $show->field('ordernum');
            $show->field('pic');
            $show->field('linkurl');
            $show->field('txt1');
            $show->field('content');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(Ad::with('adTings'), function (Form $form) {
            $form->tab('基本', function ($form) {
                $form->text('title')->required();
                $form->text('code')->help('数据访问使用')->required();
                $form->select('type')->options(Ext::selectOptions(15));
                $form->image('pic');
                $form->number('ordernum');
            });
            $form->tab('扩展', function ($form) {
                $form->url('linkurl');
                $form->hasMany('adTings', '多文本', function (Form\NestedForm $form) {
                    $form->text('code')->default();
                    $form->textarea('txt');
                });
            });
            $form->tab('内容', function ($form) {
                $form->ckeditor('content');
            });
        });
    }
}
