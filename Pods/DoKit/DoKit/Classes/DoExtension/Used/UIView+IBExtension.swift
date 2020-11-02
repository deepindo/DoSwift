//
//  UIView+IBExtension.swift
//  MCHT
//
//  Created by mac on 2019/12/12.
//  Copyright © 2019 deepindo. All rights reserved.
//

import Foundation

//OC的分类中不可以定义属性 不可以定义成员变量  可以定义只读属性也可以定义方法
extension UIView {
    
    //定义可视化属性
    //制度属性  没有存储值的功能
    //只读属性 和 有返回值的方法是一样的
//    @IBInspectable var cornerRadius: CGFloat  {
//        set {
//            //设置layer的圆角的属性
//            layer.cornerRadius = newValue
//            layer.masksToBounds = newValue > 0
//        }
//        get {
//            return layer.cornerRadius
//        }
//    }
    
    public func setShadow(color: UIColor, offset: CGSize, opacity: CGFloat, radius: CGFloat) {
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        //Opacity透明度
        self.layer.shadowOpacity = Float(opacity)
        //模糊度
        self.layer.shadowRadius = radius
    }
    
    public var frameX: CGFloat {
        get {
            return self.frame.origin.x
        }
    }
    
    public var frameY: CGFloat {
        get {
            return self.frame.origin.y
        }
    }
//    var width: CGFloat {
//        get {
//            return self.frame.size.width
//        }
//    }
//    var height: CGFloat {
//        get {
//            return self.frame.size.height
//        }
//    }
    
    
    
}
