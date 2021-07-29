<?php

namespace App\Http\Interfaces;

interface InfoInter
{
    public function list(int $parent_id = 0);

    public function details(int $id);
}
