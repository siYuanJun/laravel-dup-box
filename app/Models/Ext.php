<?php

namespace App\Models;

use Dcat\Admin\Support\Helper;
use Dcat\Admin\Traits\HasDateTimeFormatter;

use Dcat\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Mockery\Matcher\Any;
use PhpParser\Node\Expr\Array_;
use PhpParser\Node\Expr\New_;
use Spatie\EloquentSortable\Sortable;

class Ext extends Model implements Sortable
{
    use HasDateTimeFormatter,
        ModelTree {
        ModelTree::boot as treeBoot;
    }

    protected $table = 'ext';

    protected $fillable = ['parent_id', 'title', 'pic', 'order', 'content'];

    /**
     * Get options for Select field in form.
     *
     * @param \Closure|null $closure
     *
     * @return array
     */
    public static function selectOptions($parentld = 0) : Array
    {
        $options = (new static())->withQuery()->buildSelectOptions([], $parentld);
        return collect($options)->all();
    }

}

