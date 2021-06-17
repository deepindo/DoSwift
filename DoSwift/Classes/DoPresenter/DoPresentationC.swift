//
//  DoPresentationC.swift
//  DoPresenter
//
//  Created by deepin do on 2020/4/12.
//

import UIKit

open class DoPresentationC: UIPresentationController {

    public var presentViewHeight: CGFloat = 0.0
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        let vc = presentedViewController as! DoPresenterVC
        if let rect = vc.customPresentView?.bounds {
            presentViewHeight = rect.size.height
        } else {
            presentViewHeight = 240.0 + kSafeAreaBottomHeight /// 默认值
        }

        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    /// 决定了弹出框的frame
    override open var frameOfPresentedViewInContainerView: CGRect {
        /// 这里可以根据位置等深度扩展
        return CGRect(x: 0, y: kScreenHeight - presentViewHeight, width: kScreenWidth, height: presentViewHeight)
    }
    
    /// 重写此方法可以在弹框即将显示时执行所需要的操作
    override open func presentationTransitionWillBegin() {
        self.coverView.alpha = 0
        containerView?.addSubview(coverView)
        UIView.animate(withDuration: 0.5) {
            self.coverView.alpha = 0.3
        }
    }
    
    /// 重写此方法可以在弹框显示完毕时执行所需要的操作
    override open func presentationTransitionDidEnd(_ completed: Bool) {
    }
    
    /// 重写此方法可以在弹框即将消失时执行所需要的操作
    override open func dismissalTransitionWillBegin() {
        UIView.animate(withDuration: 0.5) {
            self.coverView.alpha = 0
        }
    }
    
    /// 重写此方法可以在弹框消失之后执行所需要的操作
    override open func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            self.coverView.removeFromSuperview()
        }
    }
    
    @objc private func coverViewDidTapped() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }

    lazy var coverView: UIView = {
        let containerbounds = containerView?.bounds ?? UIScreen.main.bounds
        let v = UIView(frame: containerbounds)
        v.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        v.alpha = 0
        
        let ges = UITapGestureRecognizer(target: self, action: #selector(coverViewDidTapped))
        v.addGestureRecognizer(ges)
        
        return v
    }()
}

