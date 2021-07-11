<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use DateTimeInterface;
use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

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
class Worker extends Model
{
    use DefaultDatetimeFormat;

	protected $table = 'worker';
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

    public static function getWorkerName($id)
    {
        $data = self::query()->find($id);
        return $data['name'] ?? "";
    }


    public static function getAllWorker($cid)
    {
        $data = self::all();
        if ($cid) {
            $data->where("company_id",$cid);
        }
        return $data->pluck("name","id");
    }



    public static function getWorkerIdByIdcards($idcards)
    {
       $data = self::query()->whereIn("idcards",$idcards)->select("id","idcards")->get();
       $data = $data->toArray();
       $new = [];
       foreach ($data as $value) {
           $new[$value['idcards']] = $value['id'];
       }
       return $new;
    }

}
