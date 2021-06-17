//
//  UIView+Extension.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/4.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation

extension UIView {

    /// 获取view所在VC
    public func firstVC() -> UIViewController? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let responder = view?.next {
                if responder.isKind(of: UIViewController.self){
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
    
    /// 返回该view所在的父view
    public func superView<T: UIView>(of: T.Type) -> T? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let father = view as? T {
                return father
            }
        }
        return nil
    }
    
    /// 截屏Image
    public var captureImage: UIImage? {
        
        // 参数①：截屏区域  参数②：是否透明  参数③：清晰度
        UIGraphicsBeginImageContextWithOptions(frame.size, true, UIScreen.main.scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image
    }
}
