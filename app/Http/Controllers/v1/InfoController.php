<?php

namespace App\Http\Controllers\v1;

use App\Http\Controllers\Controller;
use App\Http\Interfaces\InfoInter;
use App\Models\Column;
use App\Models\Info;
use Illuminate\Http\Request;

/**
 * @group article
 * 文章
 */

class InfoController extends Controller implements InfoInter
{

    private $model;

    public function __construct()
    {
        $this->model = new Info();
    }

    /**
     * list
     * 文章列表
     * @param int $parent_id
     * @return array
     */
    public function list(int $classid = 0): array
    {
        return reply(
            $this->model->where(['classid' => $classid])->get()->map(function($val) {
                return $this->forVal($val);
            })
        );
    }

    /**
     * details
     * 文章详情
     * @param int $id
     * @return array
     */
    public function details(int $id): array
    {
        return reply(
            $this->forVal($this->model->where(['id' => $id])->first())
        );
    }

    private function forVal($val)
    {
        $val->_classname = $val->column->title;
        $val->pic = imgUrl($val->pic);
        $val->_property = $this->model->getExtVal((array)json_decode($val->property));
        return $val;
    }
}
