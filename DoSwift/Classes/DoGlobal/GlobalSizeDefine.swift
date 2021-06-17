//
//  GlobalSizeDefine.swift
//  NoWhite
//
//  Created by deepin do on 2020/2/28.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation
import UIKit


//MARK: - 通用变量定义

/// 主window
public let kSharedWindow   = UIApplication.shared.keyWindow

/// 主delegate
public let kSharedDelegate = UIApplication.shared.delegate

/// 屏幕宽度
public let kScreenWidth   = UIScreen.main.bounds.width

/// 屏幕高度
public let kScreenHeight  = UIScreen.main.bounds.height

/// 偏好设置
public let kUserDefaults  = UserDefaults.standard

/// 设备比例
public let kDeviceScale: CGFloat  = kScreenWidth / 375

/// 导航栏高度
public let kNavBarH: CGFloat    = IS_IPhoneX_Serial ? 88 : 64

/// 底部Tabbar高度
public let kTabBarH: CGFloat    = IS_IPhoneX_Serial ? 83 : 49

/// 状态栏高度
public let kStatusBarH: CGFloat = IS_IPhoneX_Serial ? 44 : 20

/// 底部安全区高度
public let kSafeAreaBottomHeight: CGFloat = IS_IPhoneX_Serial ? 34 : 0

/// tableView的头尾高
public let kHeaderFooterHeight: CGFloat = 0.01

/// tableView的cell高
public let kTableCellHeight:    CGFloat = 55.0

/// 通用间距
public let kCommonMargin: CGFloat = 15
