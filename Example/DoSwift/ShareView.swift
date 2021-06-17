//
//  ShareView.swift
//  DoKit_Example
//
//  Created by deepin do on 2020/4/13.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import DoSwift

class ShareView: UIView {

    var cancelBtn: UIButton!
    
    var cancelClosure: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        cancelBtn = UIButton()
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.setTitleColor(UIColor.gray, for: .normal)
        cancelBtn.addTarget(self, action: #selector(cancelBtnDidClick), for: .touchUpInside)
        cancelBtn.frame = CGRect(x: 0, y: self.bounds.size.height - kSafeAreaBottomHeight - 40, width: kScreenWidth, height: 40)
        
        self.addSubview(cancelBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func cancelBtnDidClick() {
        cancelClosure?()
    }

}
