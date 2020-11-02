//
//  UIBarButtonItem+Extension.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/4.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation


extension UIBarButtonItem {
    
    public convenience init(title: String = "", imageName: String? = nil, target: Any?, action: Selector) {
        
        let btn = UIButton()
        
        if imageName != nil {
            btn.setImage(DDImage(imageName!), for: .normal)
            //btn.setImage(DDImage(imageName! + "_highlighted"), for: .highlighted)
        }
        
        btn.setTitle(title, for: .normal)
        btn.setTitle(title, for: .highlighted)
        btn.titleLabel?.font = kSystemFont(15)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.white, for: .highlighted)
        btn.sizeToFit()
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        self.init()
        
        self.customView = btn
    }
}
