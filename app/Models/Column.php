<?php

namespace App\Models;

use Dcat\Admin\Support\Helper;
use Dcat\Admin\Traits\HasDateTimeFormatter;

use Dcat\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Spatie\EloquentSortable\Sortable;

class Column extends Model implements Sortable
{
    use HasDateTimeFormatter,
        ModelTree {
        ModelTree::boot as treeBoot;
    }

    protected $table = 'column';

    protected $fillable = ['parent_id', 'title', 'order', 'content'];

    use HasDateTimeFormatter,
        ModelTree {
        ModelTree::boot as treeBoot;
    }

    /**
     * Get options for Select field in form.
     *
     * @param \Closure|null $closure
     *
     * @return array
     */
    public static function selectOptions(\Closure $closure = null)
    {
        $options = (new static())->withQuery($closure)->buildSelectOptions();

        return collect($options)->all();
    }

    /**
     * Detach models from the relationship.
     *
     * @return void
     */
    protected static function boot()
    {
        static::treeBoot();

        parent::boot();

        static::deleting(function ($model) {
            $model->roles()->detach();
        });
    }

}

