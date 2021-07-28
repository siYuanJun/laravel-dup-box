<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;
use Illuminate\Database\Eloquent\Model;

class Ad extends Model
{
	use HasDateTimeFormatter;

    protected $table = 'ad';

    public function adTings()
    {
        return $this->hasMany(AdTing::class, 'ad_id');
    }

    public function extTing()
    {
        return $this->belongsTo(Ext::class, 'type');
    }
}
