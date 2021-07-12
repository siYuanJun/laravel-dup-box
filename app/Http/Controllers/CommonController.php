<?php

namespace App\Http\Controllers;

use App\Services\CommonService;
use Cassandra\Aggregate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CommonController extends Controller
{
    /**
     * 上传文件
     * @param Request $request
     */
    public function uploadFile(Request $request)
    {
        $address = $request->input("address");
        $address = $address ?? "";
        $file = $request->file("file");
        if ($file && $file->isValid()) {
            $ext = $file->getClientOriginalExtension();
            $realPath = $file->getRealPath();
            $filename = uniqid().'.'.$ext;
            $newFilename = public_path("uploads") . "/" . $filename;
            CommonService::addWaterMark($realPath, $newFilename, $address);
            $bool = Storage::disk('cosv5')->put($filename,file_get_contents($newFilename));
            unlink($newFilename);
            //判断是否上传成功
            if($bool){
                return reply([
                    'fileName' => $filename,
                    'fileUrl' => env("COSV5_HTTP_URL") .$filename
                ]);
            }else{
                return reply("上传出错",2);
            }
        }
        return reply("请上传",1);
    }
}
