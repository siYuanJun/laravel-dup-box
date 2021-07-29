<?php
/**
 * 帮助函数
 */


/**
 * 获取状态
 * @param $status
 */
if (!function_exists('getStatus')) {
    function getStatus($status, $key)
    {
        $arr = config("status." . $key);
        return $arr[$status] ?? "";
    }
}


/**
 * 返回信息
 * @param $status
 */
if (!function_exists('reply')) {
    function reply($message = "ok", $code = 0, $data = null): array
    {
        if (!is_string($message) && $data == null) {
            $data = $message;
            $message = "";
        }
        return [
            "code" => $code,
            "msg" => $message,
            "data" => $data
        ];
    }
}


/**
 * 验证手机号
 */
if (!function_exists("verifyPhone")) {
    function verifyPhone($phone)
    {
        $regExp = "/^1(3[0-9]|4[5,7]|5[0,1,2,3,5,6,7,8,9]|6[2,5,6,7]|7[0,1,7,8]|8[0-9]|9[1,8,9])\\d{8}$/";
        return preg_match($regExp, $phone);
    }
}

/**
 * 发送post请求
 */
if (!function_exists("requestPost")) {
    function requestPost($url, $data = [])
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        // POST数据
        curl_setopt($ch, CURLOPT_POST, 1);
        // 把post的变量加上
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        $output = curl_exec($ch);
        curl_close($ch);
        return json_decode($output, true);
    }
}

/**
 * 发送get请求
 */
if (!function_exists("requestGet")) {
    function requestGet($url, $header = [])
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        $output = curl_exec($ch);
        curl_close($ch);
        return json_decode($output, true);
    }
}

/**
 * 记录日志
 */
if (!function_exists("recordLog")) {
    function recordLog($fileUrl)
    {
        $content = file_get_contents("php://input");
        $dateTime = date("Y-m-d H:i:s", time());
        $dateString = PHP_EOL . '-----' . $dateTime . '-----' . PHP_EOL;
        file_put_contents(public_path("/" . $fileUrl), $dateString . $content . $dateString, FILE_APPEND);
        parse_str($content, $data);
        return $data;
    }
}


/**
 * 获取两个日期的相差天数
 */
if (!function_exists("getDiffDayNum")) {
    function getDiffDayNum($day1, $day2)
    {
        $second1 = strtotime($day1);
        $second2 = strtotime($day2);

        if ($second1 < $second2) {
            $tmp = $second2;
            $second2 = $second1;
            $second1 = $tmp;
        }
        return ceil(($second1 - $second2) / 86400);
    }
}

/**
 * 获取两个日期的相差天数
 */
if (!function_exists("getDates")) {
    function getDates($start, $end)
    {
        $dt_start = strtotime($start);
        $dt_end = strtotime($end);
        $arr = [];
        while ($dt_start <= $dt_end) {
            $arr[] = date('Y-m-d', $dt_start);
            $dt_start = strtotime('+1 day', $dt_start);
        }
        return $arr;
    }
}


if (!function_exists("arr_to_xml")) {
    function arr_to_xml($data, $root = true)
    {
        $str = "";
        if ($root) {
            $str .= "<xml>";
        }
        foreach ($data as $key => $val) {
            if (is_array($val)) {
                $child = arr_to_xml($val, false);
                $str .= "<$key>$child</$key>";
            } else {
                $str .= "<$key><![CDATA[$val]]></$key>";
            }
        }
        if ($root) {
            $str .= "</xml>";
        }
        return $str;
    }
}

if (!function_exists("imgUrl")) {
    function imgUrl($pic): string
    {
        return env("APP_URL") . '/uploads/' . $pic;
    }
}
