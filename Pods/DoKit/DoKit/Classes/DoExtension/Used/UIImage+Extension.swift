//
//  UIImage+Extension.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/4.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    /// 截取当前屏幕
    public class func takeScreenshot() -> UIImage {
        var imageSize = CGSize.zero
        let screenSize = UIScreen.main.bounds.size
        let orientation = UIApplication.shared.statusBarOrientation
        if orientation.isPortrait {
            imageSize = screenSize
        } else {
            imageSize = CGSize(width: screenSize.height, height: screenSize.width)
        }
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            for window in UIApplication.shared.windows {
                context.saveGState()
                context.translateBy(x: window.center.x, y: window.center.y)
                context.concatenate(window.transform)
                context.translateBy(x: -window.bounds.size.width * window.layer.anchorPoint.x, y: -window.bounds.size.height * window.layer.anchorPoint.y)
                
                if orientation == UIInterfaceOrientation.landscapeLeft {
                    context.rotate(by: .pi / 2)
                    context.translateBy(x: 0, y: -imageSize.width)
                } else if orientation == UIInterfaceOrientation.landscapeRight {
                    context.rotate(by: -.pi / 2)
                    context.translateBy(x: -imageSize.height, y: 0)
                } else if orientation == UIInterfaceOrientation.portraitUpsideDown {
                    context.rotate(by: .pi)
                    context.translateBy(x: -imageSize.width, y: -imageSize.height)
                }
                if window.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:))) {
                    window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
                } else {
                    window.layer.render(in: context)
                }
                context.restoreGState()
            }
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = image {
            return image
        } else {
            return UIImage()
        }
    }
    
    // 截屏的类方法--有返回值
    public class func getScreenCapture() -> UIImage {
        
        /// 开启图片上下文
        let window = UIApplication.shared.keyWindow!
        UIGraphicsBeginImageContextWithOptions(window.bounds.size, false, UIScreen.main.scale)
        
        /// 将当前的window绘制到图片上下文中
        window.drawHierarchy(in: window.bounds, afterScreenUpdates: false)
        
//        if window.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:))) {
//            window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
//        } else {
//            window.layer.render(in: UIGraphicsGetCurrentContext()!)
//        }

        /// 从图片上下文中获取图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        /// 关闭图片上下文
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    // 等比例压缩图片
    public func compressImage(compressW: CGFloat) -> UIImage {
        //获取当前图片的宽和高
        let imageW = self.size.width
        let imageH = self.size.height
        
        //拿当前图片的宽和压缩宽比较
        if imageW < compressW{
            return self
        }
        
        //根据宽高比,计算压缩后的高度
        let compressScale = compressW / imageW
        
        //计算压缩后的高
        let compressH = imageH * compressScale
        
        //压缩后图片的bounds
        let compressBounds = CGRect(x: 0, y: 0, width: compressW, height: compressH)
        
        //开启图片上下文
        UIGraphicsBeginImageContextWithOptions(compressBounds.size, false, UIScreen.main.scale)
        //绘制
        self.draw(in: compressBounds)
        //根据上下文获得图片
        let compressImage = UIGraphicsGetImageFromCurrentImageContext()
        //关闭图片上下文
        UIGraphicsEndImageContext()
        
        return compressImage!
    }
    
    // 将图片写入相册
    public func writeImageToAlbum() {
        // 少了一个判断是否有写入权限的方法
        UIImageWriteToSavedPhotosAlbum(self, self, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func writeImageToAlbum(_ image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc fileprivate func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafeRawPointer) {
        if let _ = error as NSError? {
            DDLog("保存失败，请重试")
        } else {
            DDLog("保存成功！")
        }
    }
}



