<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use DateTimeInterface;
use Dcat\Admin\Traits\HasDateTimeFormatter;
use Illuminate\Database\Eloquent\Model;
use Mockery\Matcher\Any;
use phpDocumentor\Reflection\Types\Integer;

/**
 * Class Worker
 *
 * @property int $id
 * @property string|null $phone
 * @property string|null $name
 * @property string|null $sex
 * @property int|null $age
 * @property string|null $edu
 * @property string|null $home
 * @property string|null $polity
 * @property bool|null $marry
 * @property string|null $image
 * @property Carbon|null $create_time
 * @property string|null $idcards
 * @property bool|null $status
 *
 * @package App\Models
 */

class Us extends Model
{
    use HasDateTimeFormatter;

    protected $table = 'us';
    public $timestamps = true;

    const CREATED_AT = 'create_time';
    const UPDATED_AT = null;

    protected $casts = [
        'age' => 'int',
        'marry' => 'int',
        'status' => 'int'
    ];

    protected $dates = [
        'create_time'
    ];

    protected $fillable = [
        'phone',
        'name',
        'sex',
        'age',
        'edu',
        'home',
        'polity',
        'marry',
        'image',
        'create_time',
        'idcards',
        'status'
    ];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public static function getWorkerName(Integer $id, array $field = ["*"])
    {
        return self::query()->find($id, $field);
    }
}
