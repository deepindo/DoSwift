//
//  ViewController.swift
//  DoSwift
//
//  Created by deepin on 06/16/2021.
//  Copyright (c) 2021 deepin. All rights reserved.
//

import UIKit
import DoSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton()
        btn.setTitle("测试", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.addTarget(self, action: #selector(test), for: .touchUpInside)
        
        btn.frame = CGRect(x: 100, y: 200, width: 100, height: 50)
        self.view.addSubview(btn)
    }

    @objc func test() {
        
        let shareView = ShareView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kSafeAreaBottomHeight + 340))

        // 创建贝塞尔曲线，指定绘制区域、角和角半径
        let bezier = UIBezierPath(roundedRect: shareView.bounds, byRoundingCorners: [.topLeft, .topRight] , cornerRadii: CGSize(width: 20, height: 0))
        let shapeLayer = CAShapeLayer() /// 初始化shapeLayer
        shapeLayer.path = bezier.cgPath /// 设置绘制路径
        shareView.layer.mask = shapeLayer /// 将shapeLayer设置为shareView的layer的mask(遮罩)
        
        shareView.cancelClosure = {
            self.dismiss(animated: true, completion: nil)
        }
        
        /// present
        let vc = DoPresenterVC()
        vc.customPresentView = shareView
        //let vc = UIViewController()
        self.present(vc, animated: true, completion: nil)
        //do_present(vc, animated: true)
    }

}

