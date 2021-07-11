<?php

namespace App\Services;

use phpDocumentor\Reflection\Types\Boolean;

/**
 * 法大大接口API
 * @Author haofly
 * @Date 2021/04/18
 * Class FaDaDaApi
 */
class FaDaDaApi
{

    const APPID = "404462";
    const APPSECRET = "4bf2MftP5wM7VYuoVUYZBKdR";
    const BASEURL = "https://testapi.fadada.com:8443/api/";
    const AccountRegisterApi = "account_register.api";
    const CompanyVerifyApi = "get_company_verify_url.api";
    const PersonVerifyApi = "get_person_verify_url.api";
    const UploadDocsApi = "uploaddocs.api";
    const AutoSignApi = "extsign_auto.api";
    const SignApi = "extsign.api";
    const beforeAutoApi = "before_authsign.api";
    const ViewContractApi = "viewContract.api";
    const contractFilingApi = "contractFiling.api";
    const downLoadContractApi = "downLoadContract.api";
    const VerifyNotifyUrl = "/api/verifyNotify";
    const SignNotifyUrl = "/api/signNotify";
    const AccountOpenID = "LHAT_";
    const ContractNo = "LHCT_";
    const TransactionNo = "LHTS_";


    /**
     * 获取公共参数
     * @param $params 业务参数
     * @return array
     */
    private static function getIntegralParams($params = [])
    {
        $timestamp = date("YmdHis",time());
        ksort($params);
        $string = self::APPSECRET;
        foreach ($params as $value) {
            $string .= $value;
        }
        $msg_digest = base64_encode(strtoupper(sha1(self::APPID . strtoupper(md5($timestamp)) . strtoupper(sha1($string)))));
        $commonParams = [
            "app_id" => self::APPID,
            "timestamp" => $timestamp,
            "v" => "2.0",
            "msg_digest" => $msg_digest
        ];
        return array_merge($commonParams,$params);
    }


    /**
     * 注册账号
     * @param $uid
     * @param $type
     * @return mixed
     */
    public static function accountRegister($uid, $type)
    {
        $params = [
            "open_id" => self::AccountOpenID . $type . "_" . $uid,
            "account_type" => $type == 1 ? 1 : 2
        ];
        $params = self::getIntegralParams($params);
        return requestPost(self::BASEURL . self::AccountRegisterApi,$params);
    }


    /**
     * 企业认证
     * @param $customerId
     * @param string $option
     * @return mixed
     */
    public static function companyVerify($customerId, $option = "add")
    {
        $params = [
            "customer_id" => $customerId,
            "page_modify" => 1,
            "option" => $option,
            "cert_flag" => "1",
            "notify_url" =>  env("APP_URL") . self::VerifyNotifyUrl,
            "return_url" => env("APP_URL") . '/admin/contracts'
        ];
        $params = self::getIntegralParams($params);
        $res = requestPost(self::BASEURL . self::CompanyVerifyApi,$params);
        if ($res['code'] == 1) {
            $res['data']['url'] = base64_decode($res['data']['url']);
        }
        return $res;
    }




    /**
     * 个人认证
     * @param $customerId
     * @param string $option
     * @return mixed
     */
    public static function personVerify($customerId, $option = "add")
    {
        $params = [
            "customer_id" => $customerId,
            "verified_way" => 9,
            "page_modify" => 1,
            "option" => $option,
            "cert_flag" => "1",
            "is_mini_program" => 1,
            "notify_url" =>  env("APP_URL") . self::VerifyNotifyUrl
        ];
        $params = self::getIntegralParams($params);
        $res = requestPost(self::BASEURL . self::PersonVerifyApi,$params);
        if ($res['code'] == 1) {
            $res['data']['url'] = base64_decode($res['data']['url']);
        }
        return $res;
    }


    /**
     * 上传合同
     * @param $contractId
     * @param $docTitle
     * @param $docUrl
     * @param $docType
     * @return Array code 1000 正确
     */
    public static function uploadDocs($contractId, $docTitle, $docUrl, $docType = ".pdf")
    {
        $params1 = [
            "contract_id" => self::ContractNo . $contractId
        ];
        $params1 = self::getIntegralParams($params1);
        $params2 = [
            "doc_title" => $docTitle,
            "doc_url" => $docUrl,
            "doc_type" => $docType
        ];
        $params = array_merge($params1,$params2);
        return requestPost(self::BASEURL . self::UploadDocsApi,$params);
    }


    /**
     * 签署合同
     * @param $type
     * @param $transactionId
     * @param $contractId
     * @param $customerId
     * @param $docTitle
     * @param string $clientRole
     */
    public static function signContract($type, $transactionId, $contractId, $customerId, $docTitle = "", $other = [])
    {
        $params = [
            "transaction_id" => self::TransactionNo . $transactionId,
            "contract_id" => self::ContractNo . $contractId,
            "customer_id" => $customerId,
            "doc_title" => $docTitle,
            "notify_url" => env("APP_URL") . self::SignNotifyUrl
        ];
        $params = array_merge($params,$other);

        $timestamp = date("YmdHis",time());

        $msg_digest = base64_encode(strtoupper(sha1(self::APPID . strtoupper(md5($params['transaction_id'] . $timestamp)) . strtoupper(sha1(self::APPSECRET . $params['customer_id'])))));
        $commonParams = [
            "app_id" => self::APPID,
            "timestamp" => $timestamp,
            "v" => "2.0",
            "msg_digest" => $msg_digest
        ];
        $params = array_merge($commonParams,$params);
        if ($type) {
            return requestPost(self::BASEURL . self::AutoSignApi, $params);
        }
        return self::BASEURL . self::SignApi . '?' . http_build_query($params);
    }


    /**
     * @param $type
     * @param $transactionId
     * @param $contractId
     * @param $customerId
     * @param string $docTitle
     * @param string $clientRole
     * @return mixed|string
     */
    public function beforeAuthSign($transactionId, $contractId, $customerId, $docTitle = "")
    {
        $params = [
            "transaction_id" => self::TransactionNo . $transactionId,
            "contract_id" => self::ContractNo . $contractId,
            "customer_id" => $customerId,
            "doc_title" => $docTitle,
            "notify_url" => env("APP_URL") . self::SignNotifyUrl,
            "return_url" => env("APP_URL")
        ];

        $timestamp = date("YmdHis",time());

        $msg_digest = base64_encode(strtoupper(sha1(self::APPID . strtoupper(md5($params['transaction_id'] . $timestamp)) . strtoupper(sha1(self::APPSECRET . $params['customer_id'])))));
        $commonParams = [
            "app_id" => self::APPID,
            "timestamp" => $timestamp,
            "v" => "2.0",
            "msg_digest" => $msg_digest
        ];

        $params = array_merge($commonParams,$params);

        return self::BASEURL . self::beforeAutoApi . '?' . http_build_query($params);
    }

    /**
     * 查看合同签署
     * @param $contractNo
     */
    public static function viewContract($contractNo)
    {
        $params = [
            "contract_id" => self::ContractNo . $contractNo,
        ];
        $params = self::getIntegralParams($params);
        return self::BASEURL . self::ViewContractApi . '?' . http_build_query($params);
    }

    /**
     * 合同归档
     * @param $contractNo
     */
    public static function contractFiling($contractNo)
    {
        $params = [
            "contract_id" => self::ContractNo . $contractNo,
        ];
        $params = self::getIntegralParams($params);
        $res = requestPost(self::BASEURL . self::contractFilingApi,$params);
        if ($res['code'] != 1000) {
           return reply("归档错误：".$res['msg'],1);
        }
        return reply();
    }


    /**
     * 获取合同下载地址
     * @param $contractNo
     */
    public static function downLoadContract($contractNo)
    {
        $params = [
            "contract_id" => self::ContractNo . $contractNo,
        ];
        $params = self::getIntegralParams($params);
        return self::BASEURL . self::downLoadContractApi . "?" . http_build_query($params);
    }


}
