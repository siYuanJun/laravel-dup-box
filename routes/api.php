<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Maatwebsite\Excel\Facades\Excel;
use App\Http\Controllers\WxController;
use App\Http\Controllers\UsController;

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

//小程序登录、授权
Route::post('/wxLogin', [WxController::class, "login"]);

////咨询留言
//Route::post("/saveMessage", [CommonController::class, "saveMessage"]);
////新闻列表
//Route::get("/newsList", [CommonController::class, "newsList"]);
////新闻详情
//Route::get("/newsDetail/{id}", [CommonController::class, "newsDetail"]);

Route::group(["middleware" => "wxAuth"], function () {
    Route::post('/getUserInfo',[UsController::class, "getUserInfo"]);
});

//测试
Route::any('/test',
    function () {
        echo 1;
    }
);
