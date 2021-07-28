<?php

use Dcat\Admin\Admin;
use Dcat\Admin\Grid;
use Dcat\Admin\Form;
use Dcat\Admin\Grid\Filter;
use Dcat\Admin\Show;

/**
 * Dcat-admin - admin builder based on Laravel.
 * @author jqh <https://github.com/jqhph>
 *
 * Bootstraper for Admin.
 *
 * Here you can remove builtin form field:
 *
 * extend custom field:
 * Dcat\Admin\Form::extend('php', PHPEditor::class);
 * Dcat\Admin\Grid\Column::extend('php', PHPEditor::class);
 * Dcat\Admin\Grid\Filter::extend('php', PHPEditor::class);
 *
 * Or require js and css assets:
 * Admin::css('/packages/prettydocs/css/styles.css');
 * Admin::js('/packages/prettydocs/js/main.js');
 *
 */

use Dcat\Admin\Form\Field\Editor; //引入

Editor::resolving(function (Editor $editor) {
    // 设置默认配置
    $editor->options([
        // 'plugins' => [ # 自定义插件
        //     'print', 'preview', 'searchreplace', 'autolink', 'directionality',
        //     'visualblocks', 'visualchars', 'fullscreen', 'image', 'link', 'media', 'template', 'code',
        //     'codesample',
        //     'table', 'charmap', 'hr', 'pagebreak', 'nonbreaking', 'anchor', 'insertdatetime',
        //     'advlist', 'lists', 'wordcount', 'imagetools', 'textpattern', 'help', 'emoticons',
        //     'autosave', 'bdmap', 'indent2em', 'autoresize', 'formatpainter', 'axupimgs',
        //     'importword',
        // ],
        'content_style' => "body {font-size:14px;line-height:1}", // 默认字号、行距
        'branding' => false, // 隐藏版权
        'fontsize_formats' => '11px 12px 14px 16px 18px 24px 36px 48px', // 可选字号
        'toolbar' => [ # 自定义工具栏
            'code undo redo restoredraft | cut copy paste pastetext | forecolor backcolor
bold italic underline strikethrough link anchor | alignleft aligncenter alignright alignjustify outdent indent | styleselect formatselect fontselect fontsizeselect
| bullist numlist | blockquote subscript superscript removeformat | \
 table image media charmap emoticons hr pagebreak insertdatetime print preview |
fullscreen | bdmap indent2em lineheight formatpainter axupimgs importword',
        ],
    ]);
});

Dcat\Admin\Form::extend('ckeditor', Editor::class);
