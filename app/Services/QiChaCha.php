<?php

namespace App\Services;



class QiChaCha {

    const key = "d391821676a9429aa3281131f5982278";
    const screct = "01B760CD85EAE8045F657B19EDD25512";
    const LikeSearchUrl = "http://api.qichacha.com/ECIV4/SearchWide";
    const DetailSearchUrl = "http://api.qichacha.com/ECIV4/GetBasicDetailsByName";


    public static function search($keyword)
    {
        $params = [
            'key' => self::key,
            'keyword' => $keyword
        ];
        $timestamp = time();
        $token = strtoupper(md5(self::key. $timestamp . self::screct));
        $header = ["Token:$token", "Timespan:$timestamp"];
        $url = self::DetailSearchUrl . '?'. http_build_query($params);
        return requestGet($url,$header);
    }


}
