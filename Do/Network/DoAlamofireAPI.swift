//
//  DoAlamofireAPI.swift
//  ConferenceSystem
//
//  Created by deepindo on 2020/9/18.
//  Copyright © 2020 deepindo. All rights reserved.
//

import Foundation


//**************** ...... API CODE ...... *****************
//***...................................................***
//***                                                   ***
//***                                                   ***
//***...................................................***
//**************** ...... API CODE ...... *****************

// MARK: - 认证有关

let LoginURL         = BaseURL + "index.php?r=iface/login-by-pwd"   // 账号密码登陆
let SignOutURL       = BaseURL + "index.php?r=iface/logout"         // 退出登录
let TokenVerifyURL   = BaseURL + "index.php?r=iface/check-token"    // 验证、更新延期token
let PswModifyURL     = BaseURL + "index.php?r=iface/change-pwd"     // 修改密码



// MARK: - 首页

//let ProLogVerifyURL   = BaseURL + "index.php?r=iface/check-record"          // 生产记录-检测
let ProLogSubmitURL   = BaseURL + "index.php?r=iface/save-work-record"      // 生产记录-提交



// MARK: - 领料

let MaterialQRScanURL   = BaseURL + "index.php?r=iface/get-material-info-by-id"   // 根据扫码得到的原材料ID获取原材料基本信息
let MaterialSubmitURL   = BaseURL + "index.php?r=iface/do-add-material-record"    // 领料提交



// MARK: - 我的

let ProfileInfoURL     = BaseURL + "index.php?r=iface/my-info"                      // 个人信息
let DailyLogURL        = BaseURL + "index.php?r=iface/get-one-day-detail"           // 指定天详情
let MonthlyLogURL      = BaseURL + "index.php?r=iface/get-month-detail"             // 当月详情
let MaterialLogURL     = BaseURL + "index.php?r=iface/get-material-record-list"     // 领料记录列表
let MaterialInfoURL    = BaseURL + "index.php?r=iface/get-material-record-detail"   // 领料记录详情
