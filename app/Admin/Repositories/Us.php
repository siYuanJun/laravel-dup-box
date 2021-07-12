<?php

namespace App\Admin\Repositories;

use App\Models\Us as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Us extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
