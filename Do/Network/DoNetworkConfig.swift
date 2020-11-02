//
//  DoNetworkConfig.swift
//  ConferenceSystem
//
//  Created by deepindo on 2020/9/18.
//  Copyright © 2020 deepindo. All rights reserved.
//

import Foundation

//MARK: 项目环境分类
/**
 整个项目在开发过程中，根据阶段不一样对应不同的URL，或者证书，Key等
 */
enum EnvironmentType {
    
    case DEVELOP  // 开发阶段
    
    case SIT     // 集成测试/内部测试(System Integration TestCase)
    
    case UAT     // 用户测试(User Acceptance Test)
    
    case RELEASE // 线上环境
}

//MARK: 当前项目环境
/**
 当前项目环境调整位置
*/
let kEnvironmentType: EnvironmentType = .RELEASE


//MARK: Base_URL
/**
    基类URL(包含登录等+商户功能的+代理商功能)
 */
var BaseURL: String {
    
    // 根据环境不同，作不同的判断
    switch kEnvironmentType {
        
    case .DEVELOP:
        return "http://10.77.77.155:1227/"
        
    case .SIT:
        return ""
        
    case .UAT:
        return ""
        
    case .RELEASE:
        return "http://118.31.175.99:1227/"
    }
}
