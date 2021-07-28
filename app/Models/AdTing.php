<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdTing extends Model
{

    public $timestamps = false;

    protected $table = 'ad_ting';

    protected $fillable = ['code', 'txt'];

    public function ad()
    {
        return $this->belongsTo(Ad::class, 'painter_id');
    }
}
