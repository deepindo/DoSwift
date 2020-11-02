//
//  DoTabBarC.swift
//  ConferenceSystem
//
//  Created by deepindo on 2020/9/18.
//  Copyright © 2020 deepindo. All rights reserved.
//

import UIKit
import DoKit

class DoTabBarC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
        
        prepareChild()
    }
    
    private func initialize() {
        self.delegate = self
        self.tabBar.isTranslucent = true
    }
    
    private func prepareChild() {
     
        addControllers(HomeVC(), "首页", "home", 0)
        addControllers(PostVC(), "发布", "picking", 1)
        addControllers(MeVC(), "我的", "me", 2)
    }
    
    private func addControllers(_ vc: UIViewController, _ title: String, _ image: String, _ index: Int) {
          
        vc.navigationItem.title     = title
        vc.tabBarItem.title         = title
        vc.tabBarItem.tag           = index
        
        vc.tabBarItem.image         = UIImage(named: image + "_normal")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: image + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        tabBar.tintColor = hexColor(0x1C90FF)
    
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: hexColor(0x1C90FF)], for: .selected)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .selected)

        let nav = DoNavC(rootViewController: vc)
        self.addChild(nav)
      }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        //遍历子视图
        var index = 0
        
        for subview in tabBar.subviews {
            
            if subview.isKind(of: NSClassFromString("UITabBarButton")!) {
                //获取到UITabBarButton
                if index == item.tag {
                    //遍历tabBarButton的子视图, 判断类型是否是imageView
                    for target in subview.subviews {
                        
                        if target.isKind(of: NSClassFromString("UITabBarSwappableImageView")!){
                            
                            //添加动画,修改transform
                            target.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
                            
                            //在动画闭包中执行放大的操作
                            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                                target.transform = CGAffineTransform(scaleX: 1, y: 1)
                            }, completion: { (_) in
                            })
                        }
                    }
                }
                index += 1
            }
        }
    }
}

extension DoTabBarC: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
