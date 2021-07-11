<?php

namespace App\Services;


use Intervention\Image\Facades\Image;

class CommonService
{

    /**
     * 添加水印
     * @param $file
     * @param $newFile
     * @param $addr
     */
    public static function addWaterMark($file, $newFile, $addr)
    {
        $fontPath = public_path("msyh.ttf");
        $now = date("Y-m-d H:i:s", time());
        Image::make($file)
            ->text("拍摄地址: $addr" . PHP_EOL . "拍摄时间: $now", 50, 100, function ($font) use ($fontPath) {
                $font->file($fontPath);
                $font->size(28);
                $font->color('#000000');
                $font->align('left');
            })
            ->save($newFile);
    }
}
