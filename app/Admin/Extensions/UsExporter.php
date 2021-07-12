<?php

namespace App\Admin\Extensions;

use Dcat\Admin\Grid\Exporters\ExcelExporter;
use Maatwebsite\Excel\Concerns\WithMapping;

class UsExporter extends ExcelExporter implements WithMapping
{
    protected $fileName = '用户列表.xlsx';

    protected $columns = [
        'id'                    => 'ID',
        'name'                  => '姓名',
    ];

    public function map($user) : array
    {
        return [
            $user->id,
            $user->name,
//            data_get($user, 'profile.homepage'),    // 读取关联关系数据
        ];
    }
}
