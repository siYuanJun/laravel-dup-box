<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Illuminate\Routing\Router;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group([
    'prefix' => 'web',
    'name' => 'web.',
], function (Router $router) {
    $router->any("/test", function () {
        echo "web test";
    });

    $router->get("/column/list/{parent_id?}", "ColumnController@list")
        ->where(['parent_id' => '[0-9]+']);
    $router->get("/column/details/{id}", "ColumnController@details")
        ->where(['id' => '[0-9]+']);

    $router->get("/info/list/{classid?}", "InfoController@list")
        ->where(['classid' => '[0-9]+']);
    $router->get("/info/details/{id}", "InfoController@details")
        ->where(['id' => '[0-9]+']);
});
