//
//  GlobalPhoneSize.swift
//  NoWhite
//
//  Created by deepin do on 2020/2/28.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation


//MARK: - 手机型号判断

/**
 根据尺寸判断手机型号
 */

/// 判断iPad
public let IS_IPAD           = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad

/// 判断iPhone4
public let IS_IPHONE_4       = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (__CGSizeEqualToSize(CGSize(width: 640, height: 960), (UIScreen.main.currentMode?.size)!)) && !IS_IPAD : false)

/// 判断iPhone5
public let IS_IPHONE_5       = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (__CGSizeEqualToSize(CGSize(width: 640, height: 1136), (UIScreen.main.currentMode?.size)!)) && !IS_IPAD : false)

/// 判断iPhone6
public let IS_IPHONE_678     = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (__CGSizeEqualToSize(CGSize(width: 750, height: 1334), (UIScreen.main.currentMode?.size)!)) && !IS_IPAD : false)

/// 判断iPhone678+
public let IS_IPHONE_678Plus = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (__CGSizeEqualToSize(CGSize(width: 1242, height: 2208), (UIScreen.main.currentMode?.size)!)) && !IS_IPAD : false)

/// 判断iPhoneX
public let IS_IPHONE_X       = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (__CGSizeEqualToSize(CGSize(width: 1125, height: 2436), (UIScreen.main.currentMode?.size)!)) && !IS_IPAD : false)

/// 判断iPhoneXR
public let IS_IPHONE_XR      = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (__CGSizeEqualToSize(CGSize(width: 828, height: 1792), (UIScreen.main.currentMode?.size)!)) && !IS_IPAD : false)

/// 判断iPhoneXS
public let IS_IPHONE_XS      = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (__CGSizeEqualToSize(CGSize(width: 1125, height: 2436), (UIScreen.main.currentMode?.size)!)) && !IS_IPAD : false)

/// 判断iPhoneXS_Max
public let IS_IPHONE_XS_Max  = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (__CGSizeEqualToSize(CGSize(width: 1242, height: 2688), (UIScreen.main.currentMode?.size)!)) && !IS_IPAD : false)

/// 判断iPhone11
public let IS_IPHONE_11      = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (__CGSizeEqualToSize(CGSize(width: 828, height: 1792), (UIScreen.main.currentMode?.size)!)) && !IS_IPAD : false)

/// 判断iPhone11Pro
public let IS_IPHONE_11Pro   = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (__CGSizeEqualToSize(CGSize(width: 1125, height: 2436), (UIScreen.main.currentMode?.size)!)) && !IS_IPAD : false)

/// 判断iPhone11Pro_Max
public let IS_IPHONE_11Pro_Max  = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (__CGSizeEqualToSize(CGSize(width: 1242, height: 2688), (UIScreen.main.currentMode?.size)!)) && !IS_IPAD : false)

/// 判断 所有iPhoneX系列
public let IS_IPhoneX_Serial = (IS_IPHONE_X == true || IS_IPHONE_XR == true || IS_IPHONE_XS == true || IS_IPHONE_XS_Max == true  || IS_IPHONE_11 == true  || IS_IPHONE_11Pro == true  || IS_IPHONE_11Pro_Max == true) ? true : false
