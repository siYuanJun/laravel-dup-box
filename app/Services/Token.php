<?php

namespace App\Services;


use RedisDb;


class Token
{

    const expireTime = 3600;

    /**
     * 获取token
     * @param $data
     * @return mixed
     */
    public static function createToken($data)
    {
        $token = \Str::random(40);
        RedisDb::setex($token, self::expireTime, serialize($data));
        return $token;
    }


    /**
     * 验证token
     * @param $token
     */
    public static function verifyToken($token)
    {
        $data = RedisDb::get($token);
        if ($data) {
            RedisDb::expire($token, self::expireTime);
            return unserialize($data);
        }
        return [];
    }


}
