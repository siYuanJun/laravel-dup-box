<?php

use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;
use Dcat\Admin\Admin;

Admin::routes();

Route::group([
    'prefix'     => config('admin.route.prefix'),
    'namespace'  => config('admin.route.namespace'),
    'middleware' => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    $router->resource('/us', 'UsController');
    $router->resource('/column', 'ColumnController');
    $router->resource('/ext', 'ExtController');
    $router->resource('/info', 'InfoController');
    $router->resource('/ad', 'AdController');
    $router->resource('/moban', 'MobanController');

});
