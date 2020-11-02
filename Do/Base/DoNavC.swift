//
//  DoNavC.swift
//  ConferenceSystem
//
//  Created by deepindo on 2020/9/18.
//  Copyright © 2020 deepindo. All rights reserved.
//

import UIKit

class DoNavC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
    }
    
    /** 以下两个重写后，在viewController中设置显示风格或者隐藏才会生效
     */
    override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = self.children.count > 0 ? true : false
        super.pushViewController(viewController, animated: animated)
    }
}

extension DoNavC: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count <= 1 ? false : true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count <= 1 ? false : true
    }
}
