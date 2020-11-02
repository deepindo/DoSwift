//
//  Date+Extension.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/4.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation

extension Date {

    public func dayOfWeek() -> String {
        
        let interval = self.timeIntervalSince1970
        let days = Int(interval / 86400)
        let index = (days - 3) % 7
        
        switch index {
        case 0:
            return "星期天"
        case 1:
            return "星期一"
        case 2:
            return "星期二"
        case 3:
            return "星期三"
        case 4:
            return "星期四"
        case 5:
            return "星期五"
        case 6:
            return "星期六"
        default:
            return ""
        }
    }
    
    //
    public func dateNowAsString(style: String) -> String {
        
        let dateT = self.addingTimeInterval(8 * 60 * 60)
        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        //formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = style
        
        let dateStr = formatter.string(from: dateT)
        return dateStr
    }
}
