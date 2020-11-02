//
//  UIImageView+Extension.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/4.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation

extension UIImageView {

    // 360度旋转图片
    public func rotate360Degree() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z") // 让其在z轴旋转
        rotationAnimation.toValue      = NSNumber(value: .pi * 2.0) // 旋转角度
        rotationAnimation.duration     = 10.0 // 旋转周期
        rotationAnimation.isCumulative = true // 旋转累加角度
        rotationAnimation.repeatCount  = 100000 // 旋转次数
        layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    // 停止旋转
    public func stopRotate() {
        layer.removeAllAnimations()
    }

}
