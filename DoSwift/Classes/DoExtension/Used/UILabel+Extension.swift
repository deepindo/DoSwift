//
//  UILabel+Extension.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/4.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    //便利构造函数
    public convenience init(title: String, textColor: UIColor, fontName: String, fontSize: CGFloat) {
        self.init()
        self.text = title
        self.textColor = textColor
        self.font = DoSystemFont(fontSize)
        //self.font = UIFont(name: fontName, size: fontSize)
        self.sizeToFit()
    }
    
    public convenience init(title: String, textColor: UIColor, fontSize: CGFloat) {
        self.init()
        self.text = title
        self.textColor = textColor
        self.font = DoSystemFont(fontSize)
        self.sizeToFit()
    }
}
