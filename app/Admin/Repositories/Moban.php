<?php

namespace App\Admin\Repositories;

use App\Models\Moban as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Moban extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
