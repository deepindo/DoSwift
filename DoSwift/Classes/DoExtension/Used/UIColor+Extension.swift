//
//  UIColor+Extension.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/4.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    public class func hexValue(hexValue: Int) -> UIColor {
        
        //0xFF0000
        let red   = (hexValue & 0xFF0000) >> 16;
        //0x00FF00
        let green = (hexValue & 0x00FF00) >> 8;
        //0x0000FF
        let blue  = hexValue & 0x0000FF;
        
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1)
    }
    
    public class func rgba(r:Int, g:Int, b:Int, a:CGFloat) -> UIColor {
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }    
}
