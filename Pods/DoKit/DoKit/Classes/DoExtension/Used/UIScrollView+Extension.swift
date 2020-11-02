//
//  UIScrollView+Extension.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/4.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
   public func adaptiveiOS11() {
        if #available(iOS 11, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
    }
    
    /// 截长屏Image
    public var captureLongImage: UIImage? {
        
        var image: UIImage? = nil
        let savedContentOffset = contentOffset
        let savedFrame = frame
        
        contentOffset = .zero
        frame = CGRect(x: 0, y: 0,
                       width: contentSize.width,
                       height: contentSize.height)
        
        UIGraphicsBeginImageContext(frame.size)
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: frame.size.width,
                   height: frame.size.height),
            false,
            UIScreen.main.scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        print("contentSize == \(contentSize)")
        contentOffset = savedContentOffset
        frame = savedFrame
        return image
    }
}
