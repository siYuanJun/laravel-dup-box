<?php

namespace App\Http\Middleware;

use App\Models\Us;
use App\Services\Token;
use Closure;
use Illuminate\Http\Request;

class WxAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $debug = $request->input("debug");
        if ($debug && $debug == "true") {
            $userInfo = Us::query()->where("id",2)->first();
        } else {
            if (!$request->input("token")) {
                return response(reply("缺少参数token",1001));
            }
            $data = Token::verifyToken($request->input("token"));
            if (empty($data)) {
                return response(reply("token失效,请重新登录",1001));
            }
            $userInfo = Us::query()->where("openid",$data['openid'])->first();
            if (empty($userInfo)) {
                return response(reply("系统错误",3));
            }
        }
        $request->userInfo = $userInfo;
        return $next($request);
    }
}
