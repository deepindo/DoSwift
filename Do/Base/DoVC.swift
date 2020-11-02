//
//  DoVC.swift
//  ConferenceSystem
//
//  Created by deepindo on 2020/9/18.
//  Copyright © 2020 deepindo. All rights reserved.
//

import UIKit
import DoKit
import SnapKit

/// 按钮的显示类型--暂时用不上
enum CustomBtnType {
    case image
    case text
    case imageText
    case none
}

class DoVC: UIViewController {
    
    /// 隐藏默认自定义的返回按钮
    public var isHiddenTopBar: Bool = false {
        didSet {
            customTopBar.isHidden = isHiddenTopBar
        }
    }
    
    /// 隐藏默认自定义的返回按钮
    public var isHiddenBackBtn: Bool = false {
        didSet {
            customBackButton.isHidden = isHiddenBackBtn
        }
    }
    
    /// 隐藏默认自定义的右按钮
    public var isHiddenRightBtn: Bool = false {
        didSet {
            customRightButton.isHidden = isHiddenRightBtn
        }
    }
    
    /// 隐藏底部分隔线
    public var isHiddenSepLine: Bool = true {
        didSet {
            customNavSepLine.isHidden = isHiddenSepLine
        }
    }
    
    /// 返回按钮的透明值
    public var isBackBtnAlpha: CGFloat = 1 {
        didSet {
            customBackButton.alpha = isBackBtnAlpha
        }
    }
    
    /// 右按钮透明值
    public var isRightBtnAlpha: CGFloat = 1 {
        didSet {
            customRightButton.alpha = isRightBtnAlpha
        }
    }
    
    /// 标题文字透明值
    public var isCusTitleAlpha: CGFloat = 1 {
        didSet {
            customTitleLabel.alpha = isCusTitleAlpha
        }
    }
    
    /// 自定义标题
    public var customTitle: String = "" {
        didSet {
            customTitleLabel.text = customTitle
        }
    }
    
    /// 返回按钮图片主题
//    public var backBtnThemeImage: ThemeImagePicker? {
//        didSet {
//            customBackButton.theme_setImage(backBtnThemeImage, forState: .normal)
//        }
//    }
    
    /// 右按钮图片主题
//    public var rightBtnThemeImage: ThemeImagePicker? {
//        didSet {
//            customRightButton.theme_setImage(rightBtnThemeImage, forState: .normal)
//        }
//    }
    
    /// 返回按钮的图标
    /// 清除主题设定
    public var backBtnImage: String = "" {
        didSet {
            let img = backBtnImage == "" ? nil : DDImage(backBtnImage)
            customBackButton.setImage(img, for: .normal)
        }
    }
    
    /// 右按钮的图标
    /// 清除主题设定
    public var rightBtnImage: String = "" {
        didSet {
            let img = rightBtnImage == "" ? nil : DDImage(rightBtnImage)
            customRightButton.setImage(img, for: .normal)
        }
    }
    
    /// 返回按钮的文字
    /// 清除主题设定
    public var backBtnTitle: String = "" {
        didSet {
            customBackButton.setTitle(backBtnTitle, for: .normal)
            ///backBtnThemeImage = ThemeImagePicker(names: "")
        }
    }
    
    /// 右按钮的文字
    /// 清除主题设定
    public var rightBtnTitle: String = "" {
        didSet {
            customRightButton.setTitle(rightBtnTitle, for: .normal)
        }
    }
    
    
    // MARK: - Methords Syntax
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        prepare()
        
        prepareCustomTopBar()
        
        registerNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func prepare() {
        
        //self.view.theme_backgroundColor = ThemeColorPicker(colors: kDAY_View_ColorHex, kNIG_View_ColorHex)
        self.view.backgroundColor                              = kWhiteColor
        self.navigationController?.navigationBar.isHidden      = true
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    private func prepareCustomTopBar() {
        
        self.view.addSubview(customTopBar)
        customTopBar.addSubview(customStatusBar)
        customTopBar.addSubview(customNavigationBar)
        customTopBar.addSubview(customNavSepLine)
        
        /**
         customTopBar.setShadow(color: kTX_GrayColor,
         offset: CGSize(width: 1, height: 1),
         opacity: 0.2,
         radius: 3)*/
        
        prepareCustomViews()
        
        customNavSepLine.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(customTopBar)
            make.height.equalTo(0.5)
        }
    }
    
    private func prepareCustomViews() {
        
        layoutCustomBackButton()
        layoutCustomTitleView()
        layoutCustomRightButton()
    }
    
    public func layoutCustomTitleView() {
        
        customNavigationBar.addSubview(customTitleView)
        customTitleView.snp.makeConstraints { (make) in
            make.center.equalTo(customNavigationBar)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        customTitleView.addSubview(customTitleLabel)
        customTitleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(customTitleView)
        }
    }
    
    public func layoutCustomBackButton() {
        
        customNavigationBar.addSubview(customBackButton)
        customBackButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(customNavigationBar)
            make.left.equalTo(customNavigationBar.snp.left).offset(15)
            make.width.equalTo(85)//75
            make.height.equalTo(40)//40
        }
    }
    
    public func layoutCustomRightButton() {
        
        customNavigationBar.addSubview(customRightButton)
        customRightButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(customNavigationBar)
            make.right.equalTo(customNavigationBar.snp.right).offset(-15)
            make.width.equalTo(85)//85
            make.height.equalTo(40)
        }
    }
    
    /// 系统截屏调用的通知
    fileprivate func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(userDidTakeScreenshot), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
    }
    
    /// 系统截屏处理方法
    @objc public func userDidTakeScreenshot() {
        /// 此时用户调用的系统截图已经保存到相册了
        /// 只是在app内要显示出来，最简单的办法是自己截个屏，展示
        
        /// 展示
        /// 如下拿到截图，然后操作可以自定义，可以统一在此弹框，或者在子类重写整个方法
        /// let image = UIImage.takeScreenshot()
    }
    
    /// 返回按钮点击的方法
    @objc public func customBackButtonDidClick() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    /// 右按钮点击的方法
    @objc public func customRightButtonDidClick() {}
    
    /// 状态栏的方法
    @objc public func customStatusBarDidClick() {}
    
    
    // MARK: - LAZY Syntax
    
    /// 自定义顶部bar
    lazy var customTopBar: UIView = {
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kNavBarH)
        //v.backgroundColor = kWhiteColor
        v.backgroundColor = hexColor(0x0384EA)
        
        return v
    }()
    
    /// 自定义导航栏
    lazy var customNavigationBar: UIView = {
        let v = UIView()
        v.frame = CGRect(x: 0, y: kStatusBarH, width: kScreenWidth, height: 44)
        
        return v
    }()
    
    /// 自定义状态栏
    lazy var customStatusBar: UIView = {
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusBarH)
        v.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(customStatusBarDidClick))
        v.addGestureRecognizer(tap)
        
        return v
    }()
    
    /// 左边返回按钮, 私有，只能通过公开的方法来设置属性
    lazy var customBackButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = kCustomFont(16)
        btn.contentHorizontalAlignment = .left
        btn.setImage(DDImage("btn_back_white"), for: .normal)
        btn.setTitleColor(kTX_DarkColor, for: .normal)
        //btn.theme_setImage(ThemeImagePicker(names: "back_day", "back_night"),
//                           forState: .normal)
//        btn.theme_setTitleColor(ThemeColorPicker(colors: kDAY_Title_Color, kNIG_Title_Color),
//                                forState: .normal)
        btn.addTarget(self,
                      action: #selector(customBackButtonDidClick),
                      for: .touchUpInside)
        
        return btn
    }()
    
    /// 右边按钮
    lazy var customRightButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = kCustomFont(16)
        btn.contentHorizontalAlignment = .right
        btn.setTitleColor(kTX_DarkColor, for: .normal)
//        btn.theme_setTitleColor(ThemeColorPicker(colors: kDAY_Title_Color, kNIG_Title_Color),
//                                forState: .normal)
        btn.addTarget(self,
                      action: #selector(customRightButtonDidClick),
                      for: .touchUpInside)
        
        return btn
    }()
    
    /// 中间，titleView
    lazy var customTitleView: UIView = {
        let v = UIView()
        return v
    }()
    
    /// 中间，titleLabel
    lazy var customTitleLabel: UILabel = {
        let l = UILabel()
        l.font = kCustomFont(18)
        l.textColor = kWhiteColor//kTX_DarkColor
        //l.theme_textColor = ThemeColorPicker(colors: kDAY_Title_Color, kNIG_Title_Color)
        return l
    }()
    
    /// 底部，分隔线
    lazy var customNavSepLine : UIView = {
        let v = UIView()
        v.isHidden = true
        v.backgroundColor = kSepLine_Color
        //v.theme_backgroundColor = ThemeColorPicker(colors: "#EAEAEA", "#29282D")
        return v
    }()
}
