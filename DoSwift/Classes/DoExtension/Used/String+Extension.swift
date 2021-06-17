//
//  String+Extension.swift
//  MCHT
//
//  Created by mac on 2019/12/20.
//  Copyright © 2019 deepindo. All rights reserved.
//

import Foundation

extension String {
    
    public func validateIdentityCard() -> Bool {
        let regex: String = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        //let regex: String = "(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)"
        let test: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
    
    public func validateUserName() -> Bool {
        let regex: String = "^[A-Za-z0-9]{1,15}$"
        let test: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
    
    public func validatePhoneNumber() -> Bool { // 由于新增了许多号码，所以目前从10xxx-19xxx都加上了，实际有些是不存在的
        let regex: String = "^((10[0-9])|(11[0-9])|(12[0-9])|(13[0-9])|(14[0-9])|(15[^4,\\D])|(16[0-9])|(19[0-9])|(18[0,0-9]|(17[0-9])))\\d{8}$"
        let test: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
    
    public func validateVerifyCode() -> Bool {
        let regex: String = "^[0-9]{6}$"
        let test: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
    
    public func validateEmail() -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    public func isAlphanumericAccount() -> Bool {
        let regex: String = "[A-Za-z0-9]+"
        let test: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
    
    
    //<null> 转""字符串
    mutating func changeNUll() -> (String) {
        if self == "<null>" || self == "<NULL>" || self == "<NUll>" || self == "<Null>" || self == "0.00" || self == "null" || self == "NULL" || self == "NUll" || self == "Null" {
            self = ""
        }
        return self
    }
    
    //<null> 转任意字符串
    mutating func changeNUlltoString(str: String) -> (String) {
        if self == "<null>" || self == "<NULL>" || self == "<NUll>" || self == "<Null>" || self == "0.00" || self == "null" || self == "NULL" || self == "NUll" || self == "Null" {
            self = str
        }
        return self
    }
    
    
    /**
     时间戳 <-> 转时间
     */
    // MARK: 时间戳 -> 转时间
    // "yyyy-MM-dd HH:mm:ss"
    public func timestampDateAndTime() -> (String) {
        if self == "" {
            return ""
        }
        let timeInterval: TimeInterval = TimeInterval(self)!
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //2.赋值
        return dateFormatter.string(from: date)
    }
    
    // "yyyy-MM-dd"
    public func timestampDate() -> (String) {
        if self == "" {
            return ""
        }
        let timeInterval: TimeInterval = TimeInterval(self)!
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //2.赋值
        return dateFormatter.string(from: date)
    }
    
    // "HH:mm:ss"
    public func timestampTime() -> (String) {
        if self == "" {
            return ""
        }
        let timeInterval: TimeInterval = TimeInterval(self)!
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        //2.赋值
        return dateFormatter.string(from: date)
    }

    
    
    
    
    //形式一: yyyy年MM月dd日
    public func timestampChange() -> (String) {
        if self == "" {
            return ""
        }
        let timeInterval: TimeInterval = TimeInterval(self)!
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        //2.赋值
        return dateFormatter.string(from: date)
    }
        
    //形式二: 2015-09-21
    public func timestampChangeTwo() -> (String) {
        if self == "" {
            return ""
        }
        let timeInterval: TimeInterval = TimeInterval(self)!
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //2.赋值
        return dateFormatter.string(from: date)
    }
    
    //形式三: yyyy年MM月dd日 HH:mm
    public func timestampChangeThree() -> (String) {
        if self == "" {
            return ""
        }
        let timeInterval: TimeInterval = TimeInterval(self)!
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        //2.赋值
        return dateFormatter.string(from: date)
    }
    
    //MARK: ms时间戳->转时间-
    //形式一: yyyy年MM月dd日
    public func msTimestampChange() -> (String) {
        if self == "" {
            return ""
        }
        
        let msIntValue = Int(self)
        let sIntValue  = msIntValue! / 1000
        
        let timeInterval: TimeInterval = TimeInterval(sIntValue)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        //2.赋值
        return dateFormatter.string(from: date)
    }
    
    //形式二: 2015-09-21
    public func msTimestampChangeTwo() -> (String) {
        if self == "" {
            return ""
        }
        let msIntValue = Int(self)
        let sIntValue  = msIntValue! / 1000
        let timeInterval: TimeInterval = TimeInterval(sIntValue)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //2.赋值
        return dateFormatter.string(from: date)
    }
    
    //形式三: yyyy年MM月dd日 HH:mm
    public func msTimestampChangeThree() -> (String) {
        if self == "" {
            return ""
        }
        
        let msIntValue = Int(self)
        let sIntValue  = msIntValue! / 1000
        
        let timeInterval: TimeInterval = TimeInterval(sIntValue)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        //2.赋值
        return dateFormatter.string(from: date)
    }
    
    //MARK: 时间 -> 时间戳
    //形式一: yyyy年MM月dd日
    public func stringToTimeStamp()->String {
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        let date = dfmatter.date(from: self)
        
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        let dateSt:Int = Int(dateStamp)
        
        return String(dateSt)
    }
    
    // 形式二: 2015-09-21
    public func stringToTimeStampSecond()->String {
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd"
        let date = dfmatter.date(from: self)
        
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        let dateSt:Int = Int(dateStamp)
        
        return String(dateSt)
    }
    
    //判断传入的时间差: 刚刚,几分钟之前
    public func getShowFormat() -> String {
        if self == "" {
            return ""
        }
        let timeInterval: TimeInterval = TimeInterval(self)!
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.locale = Locale.init(identifier: "en") as Locale?
        
        let requestDate = dateFormatter.date(from: dateFormatter.string(from: date))
        if requestDate == nil{
            return "时间错误"
        }
        //获取当前时间
        var formatterString = " HH:mm"
        let calendar = Calendar.current
        //判断是否是今天
        if calendar.isDateInToday(requestDate!) {
            //获取当前时间和系统时间的差距(单位是秒)
            //强制转换为Int
            let since = Int(Date().timeIntervalSince(requestDate!))
            //  是否是刚刚
            if since < 60 {
                return "刚刚"
            }
            //  是否是多少分钟内
            if since < 60 * 60 {
                return "\(since/60)分钟前"
            }
            //  是否是多少小时内
            dateFormatter.dateFormat = formatterString
            //设置时间区域
            dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale?
            //格式化
            return dateFormatter.string(from: requestDate!)
        }
        //判断是否是昨天
        
        if calendar.isDateInYesterday(requestDate!) {
            formatterString = "昨天" + formatterString
        } else {
            //判断是否是一年内
            formatterString = "MM-dd" + formatterString
            //判断是否是更早期
            
            let comps = calendar.dateComponents([Calendar.Component.year], from: requestDate!, to: Date())
            
            if comps.year! >= 1 {
                formatterString = "yyyy-" + formatterString
            }
        }
        
        //按照指定的格式将日期转换为字符串
        //创建formatter
        //        let formatter = DateFormatter()
        //设置时间格式
        dateFormatter.dateFormat = formatterString
        //设置时间区域
        dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale?
        //格式化
        return dateFormatter.string(from: requestDate!)
    }
    
//    //判断传入的时间差: 刚刚,几分钟之前
//    func getShowCusFormat() -> String {
//        if self == "" {
//            return ""
//        }
//        let timeInterval: TimeInterval = TimeInterval(self)!
//        let date = Date(timeIntervalSince1970: timeInterval)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        dateFormatter.locale = Locale.init(identifier: "en") as Locale!
//
//        let requestDate = dateFormatter.date(from: dateFormatter.string(from: date))
//        if requestDate == nil{
//            return "时间错误"
//        }
//        //获取当前时间
//        var formatterString = " HH:mm"
//        let calendar = Calendar.current
        //判断是否是今天
//        if calendar.isDateInToday(requestDate!) {
//            //获取当前时间和系统时间的差距(单位是秒)
//            //强制转换为Int
//            let since = Int(Date().timeIntervalSince(requestDate!))
//            //  是否是刚刚
//            if since < 60 {
//                return "刚刚"
//            }
//            //  是否是多少分钟内
//            if since < 60 * 60 {
//                return "\(since/60)分钟前"
//            }
//            //  是否是多少小时内
//            dateFormatter.dateFormat = formatterString
//            //设置时间区域
//            dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale!
//            //格式化
//            return dateFormatter.string(from: requestDate!)
//        }
//        判断是否是昨天
    
//        if calendar.isDateInYesterday(requestDate!) {
//            formatterString = "昨天" + formatterString
//        } else {
//            //判断是否是一年内
//            formatterString = "MM-dd" + formatterString
//            //判断是否是更早期
//
//            let comps = calendar.dateComponents([Calendar.Component.year], from: requestDate!, to: Date())
//
//            if comps.year! >= 1 {
//                formatterString = "yyyy-" + formatterString
//            }
//        }
//
//        //按照指定的格式将日期转换为字符串
//        //创建formatter
//        //        let formatter = DateFormatter()
//        //设置时间格式
//        dateFormatter.dateFormat = formatterString
//        //设置时间区域
//        dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale!
//        //格式化
//        return dateFormatter.string(from: requestDate!)
//    }
    
    // 推荐&系统消息的时间显示规则: 今天:11:45  昨天, 周二, 上周-今年: 5月6号, 去年及以上:2016年3月3日
    public func systemSuggestShowFormat() -> String {
        
        if self == "" {
            return ""
        }
        let timeInterval: TimeInterval = TimeInterval(self)!
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.locale = Locale.init(identifier: "en") as Locale?
        
        let requestDate = dateFormatter.date(from: dateFormatter.string(from: date))
        if requestDate == nil{
            return "时间错误"
        }
        //获取当前时间
        let calendar = Calendar.current
        var formatterString = " HH:mm"
        if calendar.isDateInToday(requestDate!){
            
            //设置时间格式
            dateFormatter.dateFormat = formatterString
            //设置时间区域
            dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale?
            //格式化
            return dateFormatter.string(from: requestDate!)
        }
        //昨天
        if calendar.isDateInYesterday(requestDate!) {
            formatterString = "昨天"
        } else {
            
            let since = Int(Date().timeIntervalSince(requestDate!))
            //前天-本周内的信息
            if since <= 60*60*24*8{
                
                let timeInterval: TimeInterval = TimeInterval(self)!
                let date = Date(timeIntervalSince1970: timeInterval)
                
                let interval = Int(date.timeIntervalSince1970) + NSTimeZone.local.secondsFromGMT()
                let days = Int(interval/86400) // 24*60*60
                let weekday = ((days + 4)%7+7)%7
                var temStr: String = ""
                switch weekday {
                case 1:
                    temStr = "周一"
                case 2:
                    temStr = "周二"
                case 3:
                    temStr = "周三"
                case 4:
                    temStr = "周四"
                case 5:
                    temStr = "周五"
                case 6:
                    temStr = "周六"
                default:
                    break
                    
                }
                DoLog(weekday)
                return weekday == 0 ? "周日" : temStr
                
                
            }else{
                
                let comps = calendar.dateComponents([Calendar.Component.year], from: requestDate!, to: Date())
                
                if comps.year! >= 1 {
                    formatterString = "yyyy-MM-dd"
                }else{
                    //判断是否是一年内
                    formatterString = "MM-dd"
                }
                
            }
            
        }
        
        //按照指定的格式将日期转换为字符串
        //设置时间格式
        dateFormatter.dateFormat = formatterString
        //设置时间区域
        dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale?
        //格式化
        return dateFormatter.string(from: requestDate!)
        
    }

    //MARK: 字符串MD5加密
//    var md5: String {
//
//        let str = self.cString(using: String.Encoding.utf8)
//        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8))
//        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
//        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
//
//        CC_MD5(str!, strLen, result)
//
//        let hash = NSMutableString()
//        for i in 0 ..< digestLen {
//            hash.appendFormat("%02x", result[i])
//        }
//        result.deinitialize()
//
//        return String(format: hash as String)
//    }
    
    //base64编码
    public func base64EncodeString(str: String) -> String {
        let data = str.data(using: String.Encoding.utf8)
        
        return (data?.base64EncodedString())!
        
    }
    //base64解码
    public func base64DecodeString(str: String) -> String {
        let data = Data(base64Encoded: str)
        
        return String(data: data!, encoding: String.Encoding.utf8)!
    }
    
    //MARK: 字符串Size、Width、Height
    public func subString(location:Int, length:Int) -> String {
        if location >= self.count {
            return ""
        }
        if location + length >= self.count {
            return self
        }
        let locationIndex = self.index(startIndex, offsetBy: location)
        let range = locationIndex..<self.index(locationIndex, offsetBy: length)
        return String(self[range])
    }
    
    public func getStringWidth(font: UIFont) -> CGFloat {
        return self.size(withAttributes: [NSAttributedString.Key.font: font]).width
    }
    
    
    public func getStringHeigth(font: UIFont) -> CGFloat {
        return self.size(withAttributes: [NSAttributedString.Key.font: font]).height
    }
    
    //计算字符串高度
    public func heightWithConstrainedWidth(_ width: CGFloat, _ font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)
        return boundingBox.height
    }
    
    /**获取字符串尺寸--私有方法*/
    private func getNormalStrSize(str: String? = nil, attriStr: NSMutableAttributedString? = nil, font: CGFloat, w: CGFloat, h: CGFloat) -> CGSize {
        if str != nil {
            let strSize = (str! as NSString).boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font)], context: nil).size
            return strSize
        }
        
        if attriStr != nil {
            let strSize = attriStr!.boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, context: nil).size
            return strSize
        }
        
        return CGSize.zero
    }

    /**获取字符串高度H*/
    public func getNormalStrH(str: String, strFont: CGFloat, w: CGFloat) -> CGFloat {
        return getNormalStrSize(str: str, font: strFont, w: w, h: CGFloat.greatestFiniteMagnitude).height
    }

    /**获取字符串宽度W*/
    public func getNormalStrW(str: String, strFont: CGFloat, h: CGFloat) -> CGFloat {
        return getNormalStrSize(str: str, font: strFont, w: CGFloat.greatestFiniteMagnitude, h: h).width
    }

    /**获取富文本字符串高度H*/
    public func getAttributedStrH(attriStr: NSMutableAttributedString, strFont: CGFloat, w: CGFloat) -> CGFloat {
        return getNormalStrSize(attriStr: attriStr, font: strFont, w: w, h: CGFloat.greatestFiniteMagnitude).height
    }
    
    /**获取富文本字符串宽度W*/
    public func getAttributedStrW(attriStr: NSMutableAttributedString, strFont: CGFloat, h: CGFloat) -> CGFloat {
        return getNormalStrSize(attriStr: attriStr, font: strFont, w: CGFloat.greatestFiniteMagnitude, h: h).width
    }

    
}
