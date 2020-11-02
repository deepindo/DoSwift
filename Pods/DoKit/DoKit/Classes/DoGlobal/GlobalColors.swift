//
//  GlobalColors.swift
//  MCHT
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 deepindo. All rights reserved.
//

import Foundation
import UIKit


// MARK: - 全局定义颜色

/// TabBar 图标
/// 默认颜色#666666
/// 选中颜色#18A164
/// 图标大小2x 52*52, 3x 78*78

/**
 系统颜色相关
*/
public let kWhiteColor = UIColor.white


/**
 二进制相关
 */
// 主题色--不涉及昼夜模式
public let kTheme_DefaultColor  = hexColor(0x18A164)
public let kTheme_LightColor   = hexColor(0x1BC87F)



public let kBG_TableViewColor = hexColor(0xFAFAFA)

// 文字色
public let kTX_DarkColor  = hexColor(0x333333)
public let kTX_GrayColor  = hexColor(0x666666)
public let kTX_LightColor = hexColor(0x999999)

// 分隔线颜色
public let kSepLine_Color = hexColor(0xF7F8F9) ///DDDDDD



// MARK: - 昼夜模式的颜色

// 只能用十六进制字符串代替，不能直接用UIColor
/// 标题
public let kDAY_Title_Color = "#333333"
public let kNIG_Title_Color = "#FFFFFF"

/// 普通文字
public let kDAY_TextT_ColorHex = "#18A164" // 主题色
public let kDAY_Text_ColorHex = "#333333"
public let kDAY_TextG_ColorHex = "#666666"
public let kDAY_TextL_ColorHex = "#999999"
public let kNIG_Text_ColorHex = "#858489"

/// 普通View
public let kDAY_View_ColorHex = "#FFFFFF"
public let kNIG_View_ColorHex = "#201F24"

/// tableView
public let kDAY_TableView_ColorHex = "#FAFAFA"//"#F5F5F5"
public let kNIG_TableView_ColorHex = "#232227"

/// cell
public let kDAY_Cell_ColorHex = "#FFFFFF"
public let kNIG_Cell_ColorHex = "#232227"

/// separateLineView
public let kDAY_SepLine_ColorHex = "#DDDDDD"
public let kDAY_SepView_ColorHex = "#F7F8F9"
public let kNIG_SepView_ColorHex = "#232227"

/// searchView
public let kDAY_Search_ColorHex = "#F6F7F8"
public let kNIG_Search_ColorHex = "#201F24"
