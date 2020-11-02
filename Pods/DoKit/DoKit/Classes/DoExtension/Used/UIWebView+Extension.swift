//
//  UIWebView+Extension.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/4.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation

extension UIWebView {
    public func adaptiveiOS11() {
        if #available(iOS 11, *) {
            self.scrollView.contentInsetAdjustmentBehavior = .never
            
        }
    }
}
