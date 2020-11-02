//
//  DoRequests.swift
//  ConferenceSystem
//
//  Created by deepindo on 2020/9/18.
//  Copyright © 2020 deepindo. All rights reserved.
//

import Foundation
import SwiftyJSON


// MARK: - 认证有关

extension DoAlamofireNetwork {
    
    // 账号密码登陆
    class func Login(username: String,
                     password: String,
                     success: @escaping (JSON) -> Void,
                     failure: @escaping (Any?) -> Void) -> Void {
        let dict: [String: Any] =  ["username": username,
                                    "password": password,]
        self.post(LoginURL, parameters: dict, headers: nil, success: success, failure: failure)
    }
    
    // 退出登录
    class func SignOut(success: @escaping (JSON) -> Void,
                       failure: @escaping (Any?) -> Void) -> Void {
        let token: String = UserDefaults.standard.value(forKey: "token") as! String
        let dict: [String: Any] =  ["token": token,]
        self.post(SignOutURL, parameters: dict, headers: nil, success: success, failure: failure)
    }
    
    // 验证、更新延期token
    class func TokenVerify(success: @escaping (JSON) -> Void,
                           failure: @escaping (Any?) -> Void) -> Void {
        let token: String = UserDefaults.standard.value(forKey: "token") as! String
        let dict: [String: Any] =  ["token": token,]
        self.post(TokenVerifyURL, parameters: dict, headers: nil, success: success, failure: failure)
    }
    
    // 修改密码
    class func PswModify(oldPsw: String,
                         newPsw: String,
                         success: @escaping (JSON) -> Void,
                         failure: @escaping (Any?) -> Void) -> Void {
        let token: String = UserDefaults.standard.value(forKey: "token") as! String
        let dict: [String: Any] =  ["token": token,
                                    "old_password": oldPsw,
                                    "new_password": newPsw,]
        self.post(PswModifyURL, parameters: dict, headers: nil, success: success, failure: failure)
    }
}


// MARK: - 首页

extension DoAlamofireNetwork {
    
    // 生产记录-提交
    class func ProLogSubmit(productTime: String,
                            isOverwork: String,
                            overworkSalary: String,
                            productStrs: String,
                            remark: String,
                            success: @escaping (JSON) -> Void,
                            failure: @escaping (Any?) -> Void) -> Void {
        let token: String = UserDefaults.standard.value(forKey: "token") as! String
        let dict: [String: Any] =  ["token": token,
                                    "record_time": productTime,
                                    "is_jb": isOverwork,
                                    "jb_money": overworkSalary,
                                    "detail_str": productStrs,
                                    "remark": remark]
        self.post(ProLogSubmitURL, parameters: dict, headers: nil, success: success, failure: failure)
    }
}


// MARK: - 领料

extension DoAlamofireNetwork {
    
    // 根据扫码得到的原材料ID获取原材料基本信息
    class func MaterialQRScan(materialId: String,
                              success: @escaping (JSON) -> Void,
                              failure: @escaping (Any?) -> Void) -> Void {
        let token: String = UserDefaults.standard.value(forKey: "token") as! String
        let dict: [String: Any] =  ["token": token,
                                    "material_id": materialId]
        self.post(MaterialQRScanURL, parameters: dict, headers: nil, success: success, failure: failure)
    }
    
    // 领料提交
    class func MaterialSubmit(materialId: String,
                              amount: String,
                              remark: String,
                              success: @escaping (JSON) -> Void,
                              failure: @escaping (Any?) -> Void) -> Void {
        let token: String = UserDefaults.standard.value(forKey: "token") as! String
        let dict: [String: Any] =  ["token": token,
                                    "material_id": materialId,
                                    "num": amount,
                                    "remark": remark]
        self.post(MaterialSubmitURL, parameters: dict, headers: nil, success: success, failure: failure)
    }
}


// MARK: - 我的

extension DoAlamofireNetwork {
    
    // 个人信息
    class func ProfileInfo(success: @escaping (JSON) -> Void,
                           failure: @escaping (Any?) -> Void) -> Void {
        let token: String = UserDefaults.standard.value(forKey: "token") as! String
        let dict: [String: Any] =  ["token": token,]
        self.post(ProfileInfoURL, parameters: dict, headers: nil, success: success, failure: failure)
    }
    
    // 指定天详情
    class func DailyLog(dateStr: String,
                        success: @escaping (JSON) -> Void,
                        failure: @escaping (Any?) -> Void) -> Void {
        let token: String = UserDefaults.standard.value(forKey: "token") as! String
        let dict: [String: Any] =  ["token": token,
                                    "day": dateStr,]
        self.post(DailyLogURL, parameters: dict, headers: nil, success: success, failure: failure)
    }
    
    // 当月详情
    class func MonthlyLog(beginDate: String,
                          endDate: String,
                          success: @escaping (JSON) -> Void,
                          failure: @escaping (Any?) -> Void) -> Void {
        let token: String = UserDefaults.standard.value(forKey: "token") as! String
        let dict: [String: Any] =  ["token": token,
                                    "begin_date": beginDate,
                                    "end_date": endDate,]
        self.post(MonthlyLogURL, parameters: dict, headers: nil, success: success, failure: failure)
    }
    
    // 领料记录列表
    class func MaterialLog(beginDate: String,
                           endDate: String,
                           success: @escaping (JSON) -> Void,
                           failure: @escaping (Any?) -> Void) -> Void {
        let token: String = UserDefaults.standard.value(forKey: "token") as! String
        let dict: [String: Any] =  ["token": token,
                                    "begin_date": beginDate,
                                    "end_date": endDate,]
        self.post(MaterialLogURL, parameters: dict, headers: nil, success: success, failure: failure)
    }
    
    // 领料记录详情
    class func MaterialInfo(materialId: String,
                            success: @escaping (JSON) -> Void,
                            failure: @escaping (Any?) -> Void) -> Void {
        let token: String = UserDefaults.standard.value(forKey: "token") as! String
        let dict: [String: Any] =  ["token": token,
                                    "record_id": materialId,]
        self.post(MaterialInfoURL, parameters: dict, headers: nil, success: success, failure: failure)
    }
}
