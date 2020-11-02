//
//  GlobalFuncs.swift
//  SUN9
//
//  Created by mac on 2019/12/4.
//  Copyright © 2019 deepindo. All rights reserved.
//

import Foundation
import UIKit


///** 写在最前面，
// 以下的方法若是数量过大，
// 可以考虑根据功能拆分成多个文件方便查找管理
// */
//func PermissionAutoDisplay(_ typeCode: Int, permissionCode: Int) -> Bool {
//
//    let a = 1 << typeCode
//    let b = permissionCode & a
//
//    if b > 0 {
//        return true
//    } else {
//        return false
//    }
//}



//MARK: - 自定义输出模式

/**
 在Swift中获取 文件的命的函数是 #file 转化成 OC字符串获取
 获取打印的方法名称 #function函数
 获取代码所在的行数 #line函数
 */
public func DDLog<T>(_ content: T, file: String = #file, functionName: String = #function, line: Int = #line) {
    let fileString = (file as NSString).lastPathComponent
    #if DEBUG
    print("\(fileString) line:\(line) func:\(functionName)->>>>>  content:\(content)")
    #endif
}



//MARK: - 国际化

public func DDLocalizable(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}



//MARK: - LPPopup工具类基础上实现的

public func DDNotice(_ content: String) {
    //LPPopup.popupCustomText(content)
    DDLog("will add in future")
}



//MARK: - 图片UIImage生成方法

public func DDImage(_ name: String) -> UIImage {
    return UIImage(named: name) ?? UIImage()
}



//MARK: - 延迟加载方法

/**
 设置延迟时间，
 延迟操作内容
 */
public func delay(_ delay: Double, closure: @escaping ()->()) {
    let time = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: time, execute: closure)
}



//MARK: - 时间

/**
 时间戳相关的方法
 */

// 时间转换成字符串
public func dateConvertString(date: Date) -> String {
    //let timeZone = TimeZone.init(identifier: "UTC")
    let formatter = DateFormatter()
    //formatter.timeZone = timeZone
    formatter.locale = Locale.init(identifier: "zh_CN")
    formatter.dateFormat = "yyyy-MM-dd"
    let date = formatter.string(from: date)
    
    return date.components(separatedBy: " ").first!
}

// 获取当前时间戳
public func currentStamp() -> String {
    //获取当前时间
    let now = NSDate()
    
    // 创建一个日期格式器
    let dformatter = DateFormatter()
    dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
    print("当前日期时间：\(dformatter.string(from: now as Date))")
    
    //当前时间的时间戳
    let timeInterval:TimeInterval = now.timeIntervalSince1970
    let timeStamp = Int(timeInterval)
    print("当前时间的时间戳：\(timeStamp)")
    
    return "\(timeStamp)"
}



//MARK: - 颜色

/**
 二进制、RGB等方式设计颜色
 */

// 二进制颜色
public func hexColor(_ value: Int) -> UIColor {
    //0xFF0000
    let red   = (value & 0xFF0000) >> 16;
    //0x00FF00
    let green = (value & 0x00FF00) >> 8;
    //0x0000FF
    let blue  = value & 0x0000FF;
    
    return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1)
}

// RGB颜色
public func rgba(r:Int, g:Int, b:Int, a:CGFloat) -> UIColor {
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
}
