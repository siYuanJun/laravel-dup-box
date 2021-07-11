<?php

namespace App\Imports;


use Maatwebsite\Excel\Concerns\ToCollection;
use Illuminate\Support\Collection;

class CommonImport implements ToCollection
{

    public function collection(Collection $collection)
    {
        // TODO: Implement collection() method.
        $collection->transform(function () {

        });
    }
}
