//
//  GlobalConfig.swift
//  SUN9
//
//  Created by mac on 2019/12/4.
//  Copyright © 2019 deepindo. All rights reserved.
//

import Foundation


/**
 *  此种注释用来对于有很多解释信息时用
 *
 *  // MARK:  用来对于一页分类快速定位时用
 *
 *   /// 用来注释一些字段、执行代码等
 *
 *   // 用来注释方法
*/


// MARK: - 用户的身份类型

public enum UserIdentify {
    
    case customerRole   // 单商户
    
    case agentRole      // 单代理商
     
    case doubleRole     // 两个身份都有:商户&代理商
    
    case none           // 未登录
}


// MARK: - AppKey

/// U盟AppKey
public var kUMAppKey = "5e10107fcb23d288f1000180"//"5dedad3b570df3d7df000fa7"



// MARK: - Other

/// 登录身份
public var userIdentify: UserIdentify = .none // default is .none


/// 网络状态
public var kNetworkStatus = ""


/// 默认国际化语言lproj
public let kDefaultLanguageLproj = "zh-Hans"
