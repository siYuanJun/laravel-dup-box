<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Info extends Model
{
	use HasDateTimeFormatter;

    protected $table = 'info';

    public function column() : BelongsTo
    {
        return $this->belongsTo(Column::class,"classid");
    }
}
