//
//  UIViewController+Extension.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/4.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation

extension UIViewController {
    
    public func getLabHeigh(labelStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        let statusLabelText = labelStr
        let size = CGSize(width: width, height: 900)
        let dic = [NSAttributedString.Key.font: font]
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic, context: nil).size
        return strSize.height + 3
    }
    
    public func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        let statusLabelText = labelStr
        let size = CGSize(width: 900, height: height)
        let dic = [NSAttributedString.Key.font: font]
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic, context: nil).size
        return strSize.width
    }
    
    public class func top(_ controller: UIViewController? = nil) -> UIViewController {
        
        guard let ctrl = controller else {
            let rootVC = UIApplication.shared.keyWindow?.rootViewController!
            return self.top(rootVC)
        }
        
        if ctrl.isKind(of: UINavigationController.self) {
            
            let topVC = (controller as! UINavigationController).topViewController!
            return self.top(topVC)
            
        } else if ctrl.isKind(of: UITabBarController.self) {
            
            let selectedVC = (controller as! UITabBarController).selectedViewController!
            return self.top(selectedVC)
            
        } else if ctrl.presentedViewController != nil {
            
            return self.top(ctrl.presentedViewController)
            
        } else {
            
            return ctrl
        }
    }
}



