<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class Moban extends Model
{
    use HasDateTimeFormatter;

    protected $table = 'moban';

    public function extTing()
    {
        return $this->belongsTo(Ext::class, "dir_id");
    }

    public static function selectOptions()
    {
        return collect((new static())->get()->map(function ($val) {
            $val->path = $val->extTing->title . '/' . $val['file_page'];
            return $val;
        }))->keyBy('path')->map(function ($item) {
            return $item['file_name'];
        })->prepend('无', '/');
    }
}
