//
//  GlobalFonts.swift
//  SUN9
//
//  Created by mac on 2019/12/4.
//  Copyright © 2019 deepindo. All rights reserved.
//

import Foundation
import UIKit


// MARK: - 系统默认字体字号设置方法

/**
 系统字体相关
 */
public func DoSystemFont(_ size: CGFloat) -> UIFont {
    let font = UIFont.systemFont(ofSize: size)
    
    return font
}

public func DoSystemBoldFont(_ size: CGFloat) -> UIFont {
    let font = UIFont.boldSystemFont(ofSize: size)
    
    return font
}

public func DoSystemScaleFont(_ size: CGFloat) -> UIFont {
    let currentFontSize = size * kDeviceScale
    let font = UIFont.systemFont(ofSize: currentFontSize)
    
    return font
}


// MARK: - 系统非默认字体字号设置方法

/**
 自定义字体
 */
//自定义HelveticaNeue字体
//HelveticaNeue            常规
//HelveticaNeue-Thin       瘦体
//HelveticaNeue-UltraLight 超细体
//HelveticaNeue-Light      细体
//HelveticaNeue-Medium     中等
//HelveticaNeue-Bold       粗体
public func DoCustomFont(_ size: CGFloat) -> UIFont {
    let font = UIFont(name: "HelveticaNeue", size: size)

    return font!
}

public func DoCustomULightFont(_ size: CGFloat) -> UIFont {
    let font = UIFont(name: "HelveticaNeue-UltraLight", size: size)

    return font!
}

public func DoCustomLightFont(_ size: CGFloat) -> UIFont {
    let font = UIFont(name: "HelveticaNeue-Light", size: size)

    return font!
}

public func DoCustomMediumFont(_ size: CGFloat) -> UIFont {
    let font = UIFont(name: "HelveticaNeue-Medium", size: size)

    return font!
}

public func DoCustomBoldFont(_ size: CGFloat) -> UIFont {
    let font = UIFont(name: "HelveticaNeue-Bold", size: size)

    return font!
}

public func DoCustomScaleFont(_ size: CGFloat) -> UIFont {
    let currentFontSize = size * kDeviceScale
    let font = DoSystemFont(currentFontSize)

    return font
}



// MARK: - 非系统、第三方字体字号设置方法

public func DoCusThirdFont(_ size: CGFloat) -> UIFont {
    //let font = DoThirdFont("Sui-Number", size)
    //let font = DoThirdFont("Sui-Cardniu", size)
    
    //let font = DoThirdFont("经典行书简", size)
    let font = DoThirdFont("AMCSongGBDo-Light", size) /// 庞中华行书
    
    //let font = kThirdFont("新唐人简篆体", size)
    return font
}

public func DoThirdFont(_ name: String, _ size: CGFloat) -> UIFont {
    let font = UIFont(name: name, size: size)
    return font!
}

// MARK: - 字体输出方法

/// 通过这个安装字体前后比较，就可以找出字体的真正名字
public func DoFontNameLog() {
    //var i = 0
    for value in UIFont.familyNames.enumerated() {
    //for family: String in UIFont.familyNames {
        let family = value.element
        let index = value.offset
        DoLog("\(index)---项目字体---\(family)")
        
        for names: String in UIFont.fontNames(forFamilyName: family) {
            DoLog("== \(names)")
        }
        //i += 1
    }
}

