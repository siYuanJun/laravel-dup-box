<?php

namespace App\Services;

use TencentCloud\Common\Credential;
use TencentCloud\Common\Profile\ClientProfile;
use TencentCloud\Common\Profile\HttpProfile;
use TencentCloud\Common\Exception\TencentCloudSDKException;
use TencentCloud\Faceid\V20180301\FaceidClient;
use TencentCloud\Faceid\V20180301\Models\BankCard2EVerificationRequest;
use TencentCloud\Faceid\V20180301\Models\BankCard4EVerificationRequest;
use TencentCloud\Faceid\V20180301\Models\BankCardVerificationRequest;
use TencentCloud\Faceid\V20180301\Models\CheckBankCardInformationRequest;
use TencentCloud\Faceid\V20180301\Models\IdCardVerificationRequest;
use TencentCloud\Sms\V20190711\Models\SendSmsRequest;
use TencentCloud\Sms\V20190711\SmsClient;

class TencentApi
{

    const APPID = "1305212016";
    const SecretId = "AKIDY3PZAYFChpnW8uIRA66uWxc263ACmDB7";
    const SecretKey = "30E5lC0iFaeyodDYey51Lf8Uglna8SVa";
    const SmsSdkAppId = "1400507488";

    /**
     * 身份证校验
     * @param $name
     * @param $idCard
     */
    public static function VerifyIdCard($name, $idCard)
    {
        try {
            $cred = new Credential(self::SecretId, self::SecretKey);
            $httpProfile = new HttpProfile();
            $httpProfile->setEndpoint("faceid.tencentcloudapi.com");
            $clientProfile = new ClientProfile();
            $clientProfile->setHttpProfile($httpProfile);
            $client = new FaceidClient($cred, "", $clientProfile);
            $req = new IdCardVerificationRequest();
            $params = array(
                "IdCard" => $idCard,
                "Name" => $name
            );
            $req->fromJsonString(json_encode($params));
            $res = $client->IdCardVerification($req);
            return $res->Result != 0 ? reply($res->Description, 1) : reply();
        } catch (TencentCloudSDKException $e) {
            return reply($e->getMessage(), 1);
        }
    }


    /**
     * 银行二要素验证
     * @param $idCard
     * @param $name
     * @param $bankCard
     */
    public static function VerifyBankCard3($idCard, $name, $bankCard)
    {
        try {
            $cred = new Credential(self::SecretId, self::SecretKey);
            $httpProfile = new HttpProfile();
            $httpProfile->setEndpoint("faceid.tencentcloudapi.com");
            $clientProfile = new ClientProfile();
            $clientProfile->setHttpProfile($httpProfile);
            $client = new FaceidClient($cred, "", $clientProfile);
            $req = new BankCardVerificationRequest();
            $params = array(
                "IdCard" => $idCard,
                "Name" => $name,
                "BankCard" => $bankCard
            );
            $req->fromJsonString(json_encode($params));
            $res = $client->BankCardVerification($req);
            return $res->Result != 0 ? reply($res->Description, 1) : reply();
        } catch (TencentCloudSDKException $e) {
            return reply($e->getMessage(), 1);
        }
    }


    /**
     * 银行四要素验证
     * @param $name
     * @param $idCard
     * @param $phone
     * @param $bankCard
     */
    public static function VerifyBankCard($name, $idCard, $phone, $bankCard)
    {
        try {
            $cred = new Credential(self::SecretId, self::SecretKey);
            $httpProfile = new HttpProfile();
            $httpProfile->setEndpoint("faceid.tencentcloudapi.com");

            $clientProfile = new ClientProfile();
            $clientProfile->setHttpProfile($httpProfile);
            $client = new FaceidClient($cred, "", $clientProfile);

            $req = new BankCard4EVerificationRequest();

            $params = array(
                "Name" => $name,
                "BankCard" => $bankCard,
                "Phone" => $phone,
                "IdCard" => $idCard
            );
            $req->fromJsonString(json_encode($params));
            $res = $client->BankCard4EVerification($req);
            return $res->Result != 0 ? reply($res->Description, 1) : reply();
        } catch (TencentCloudSDKException $e) {
            return reply($e->getMessage(), 1);
        }
    }


    /**
     * 发送短信
     * @param $templateID
     * @param $phoneNumberSet
     * @param $templateParamSet
     */
    public static function sendSms($templateID, $phoneNumberSet, $templateParamSet)
    {
        try {
            $cred = new Credential(self::SecretId, self::SecretKey);
            $httpProfile = new HttpProfile();
            $httpProfile->setEndpoint("sms.tencentcloudapi.com");
            $clientProfile = new ClientProfile();
            $clientProfile->setHttpProfile($httpProfile);
            $client = new SmsClient($cred, "", $clientProfile);
            $req = new SendSmsRequest();
            $params = [
                "PhoneNumberSet" => $phoneNumberSet,
                "TemplateID" => $templateID,
                "SmsSdkAppid" => self::SmsSdkAppId,
                "TemplateParamSet" => $templateParamSet,
                "Sign" => "揽活信息技术"
            ];
            $req->fromJsonString(json_encode($params));
            $client->SendSms($req);
            return reply();
        } catch (TencentCloudSDKException $e) {
            return reply($e->getMessage(), 1);
        }
    }


    /**
     * 银行卡获取开户行
     * @param $name
     * @param $bankCard
     */
    public static function getBankNameByCard($bankCard)
    {
        try {
            $cred = new Credential(self::SecretId, self::SecretKey);
            $httpProfile = new HttpProfile();
            $httpProfile->setEndpoint("faceid.tencentcloudapi.com");
            $clientProfile = new ClientProfile();
            $clientProfile->setHttpProfile($httpProfile);
            $client = new FaceidClient($cred, "", $clientProfile);
            $req = new CheckBankCardInformationRequest();
            $params = array(
                "BankCard" => $bankCard
            );
            $req->fromJsonString(json_encode($params));
            $resp = $client->CheckBankCardInformation($req);
            return $resp->Result != 0 ? reply($resp->Description, 1) : reply("ok", 0, $resp);
        } catch (TencentCloudSDKException $e) {
            return reply($e->getMessage(), 1);
        }
    }


}
