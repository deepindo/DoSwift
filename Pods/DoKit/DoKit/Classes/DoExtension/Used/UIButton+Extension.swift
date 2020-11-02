//
//  UIButton+Extension.swift
//  MCHT
//
//  Created by mac on 2019/12/23.
//  Copyright © 2019 deepindo. All rights reserved.
//

import Foundation

// 默认间隔时间
fileprivate let defaultDuration = 1.0

extension UIButton {
    
    //MARK: 按钮的初始化构造方法1
    public convenience init(title: String,
                     textColor: UIColor,
                     fontSize: CGFloat,
                     fontName: String? = "Helvetica") {
        self.init()
        setTitle(title, for: .normal)
        setTitleColor(textColor, for: .normal)
        titleLabel?.font = kCustomFont(fontSize)
        self.sizeToFit()
    }
    
    //MARK: 按钮的初始化构造方法2
    @objc func set(image anImage: UIImage?,
                   title: String,
                   titlePosition: UIView.ContentMode,
                   additionalSpacing: CGFloat,
                   state: UIControl.State) {
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
        
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        //        layoutButtonWithEdgeInsetsStyle(titilePosition: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state)
    }
    
    //MARK: 按钮的设置label位置的方法1
    private func positionLabelRespectToImage(title: String,
                                             position: UIView.ContentMode,
                                             spacing: CGFloat) {
        
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = title.size(withAttributes: [NSAttributedString.Key.font: titleFont!])
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            //new
            //            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
            //                                       left: -(imageSize.width), bottom: 0, right: 0)
            //            imageInsets = UIEdgeInsets(top: -spacing, left: 2*spacing, bottom: -1.5*spacing, right: spacing)
            
            //old
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
    
    //MARK: 按钮的设置label位置的方法2
    public func layoutButtonWithEdgeInsetsStyle(titilePosition: UIView.ContentMode, spacing: CGFloat) {
        
        let imageWidth  = self.imageView?.frame.size.width
        let imageHeight = self.imageView?.frame.size.height
        
        var labelWidth: CGFloat  = 0.0
        var labelHeight: CGFloat = 0.0
        
        if Double(UIDevice.current.systemVersion)! >= 8.0 {
            labelWidth  = (self.titleLabel?.intrinsicContentSize.width)!
            labelHeight = (self.titleLabel?.intrinsicContentSize.height)!
        } else {
            labelWidth  = (self.titleLabel?.frame.size.width)!
            labelHeight = (self.titleLabel?.frame.size.height)!
        }
        
        var imageInsets = UIEdgeInsets.zero
        var titleInsets = UIEdgeInsets.zero
        
        switch (titilePosition){
        case .top:
            titleInsets = UIEdgeInsets(top: 0, left: -imageWidth!, bottom: -(imageHeight!+spacing*0.5), right: 0)
            imageInsets = UIEdgeInsets(top: -(labelHeight+spacing*0.5), left: 0, bottom: 0, right: -labelWidth)
        case .bottom:
            titleInsets = UIEdgeInsets(top: -(imageHeight!+spacing*0.5), left: -imageWidth!, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -(labelHeight+spacing*0.5), right: -labelWidth)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: spacing*0.5, bottom: 0, right: -spacing*0.5)
            imageInsets = UIEdgeInsets(top: 0, left: -spacing*0.5, bottom: 0, right: spacing*0.5)
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageWidth!+spacing*0.5), bottom: 0, right: imageWidth!+spacing*0.5)
            imageInsets = UIEdgeInsets(top: 0, left: labelWidth+spacing*0.5, bottom: 0, right: -(labelWidth+spacing*0.5))
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
    
    
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var bounds = self.bounds
        //若原热区小于44x44，则放大热区，否则保持原大小不变
        let widthDelta = max(44.0 - bounds.size.width, 0)
        let heightDelta = max(44.0 - bounds.size.height, 0)
        bounds = bounds.insetBy(dx: -0.5 * widthDelta, dy: -0.5 * heightDelta)
        
        return bounds.contains(CGPoint(x: point.x, y: point.y))
    }
}
