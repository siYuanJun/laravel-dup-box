<?php

namespace App\Http\Controllers\v1;

use App\Http\Controllers\Controller;
use App\Http\Interfaces\InfoInter;
use App\Models\Column;
use Illuminate\Http\Request;
use PhpParser\Node\Expr\Cast\Object_;

/**
 * @group article
 * 栏目
 */

class ColumnController extends Controller implements InfoInter
{

    private $model;

    public function __construct()
    {
        $this->model = new Column;
    }

    /**
     * list
     * 栏目列表
     * @param int $parent_id
     * @return array
     */
    public function list(int $parent_id = 0): array
    {
        return reply(
            $this->model->where(['parent_id' => $parent_id])->get()
        );
    }

    /**
     * details
     * 栏目详情
     * @param int $id
     * @return array
     */
    public function details(int $id): array
    {
        return reply(
            $this->model->where(['id' => $id])->first()
        );
    }
}
