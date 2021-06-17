//
//  GlobalColors.swift
//  MCHT
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 deepindo. All rights reserved.
//

import Foundation
import UIKit


// MARkColor_: - 全局定义颜色

/// TabBar 图标
/// 默认颜色#666666
/// 选中颜色#18A164
/// 图标大小2x 52*52, 3x 78*78

/**
 系统颜色相关
*/
public let kColor_White = UIColor.white


/**
 二进制相关
 */
// 主题色--不涉及昼夜模式
//public let kColor_Theme_DefaultColor  = hexColor(0x18A164)
//public let kColor_Theme_LightColor   = hexColor(0x1BC87F)



public let kColor_BG_TableView = hexColor(0xFAFAFA)

// 文字色
public let kColor_TX_Dark  = hexColor(0x333333)
public let kColor_TX_Gray  = hexColor(0x666666)
public let kColor_TX_Light = hexColor(0x999999)

// 分隔线颜色
public let kColor_SepLine = hexColor(0xF7F8F9) ///DDDDDD



// MARkColor_: - 昼夜模式的颜色

// 只能用十六进制字符串代替，不能直接用UIColor
/// 标题
public let kColor_Title_DAY_Hex = "#333333"
public let kColor_Title_NIG_Hex = "#FFFFFF"

/// 普通文字
public let kColor_DAY_TextT_Hex = "#18A164" // 主题色
public let kColor_DAY_TextD_Hex = "#333333"
public let kColor_DAY_TextG_Hex = "#666666"
public let kColor_DAY_TextL_Hex = "#999999"
public let kColor_NIG_Text_Hex = "#858489"

/// 普通View
public let kColor_View_DAY_Hex = "#FFFFFF"
public let kColor_View_NIG_Hex = "#201F24"

/// tableView
public let kColor_TableView_DAY_Hex = "#FAFAFA"//"#F5F5F5"
public let kColor_TableView_NIG_Hex = "#232227"

/// cell
public let kColor_Cell_DAY_Hex = "#FFFFFF"
public let kColor_Cell_NIG_Hex = "#232227"

/// separateLineView
public let kColor_SepLine_DAY_Hex = "#DDDDDD"
public let kColor_SepView_DAY_Hex = "#F7F8F9"
public let kColor_SepView_NIG_Hex = "#232227"

/// searchView
public let kColor_Search_DAY_Hex = "#F6F7F8"
public let kColor_Search_NIG_Hex = "#201F24"
