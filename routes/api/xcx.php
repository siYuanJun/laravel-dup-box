<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Illuminate\Routing\Router;
use Maatwebsite\Excel\Facades\Excel;

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
    'prefix' => 'xcx',
    'name'   => 'xcx.',
], function (Router $router) {
    $router->any("/test", function () {
        echo "xcx test";
    });

    // 小程序登录、授权
    $router->post('/wxLogin', "WxController@login");

    $router->group(["middleware" => "wxAuth"], function (Router $router) {
        $router->post('/getUserInfo',"UsController@getUserInfo");
    });
});
