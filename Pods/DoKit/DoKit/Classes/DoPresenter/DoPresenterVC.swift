//
//  DoPresenterVC.swift
//  DoPresenter
//
//  Created by deepin do on 2020/4/12.
//

import UIKit

open class DoPresenterVC: UIViewController {

    public var customPresentView: UIView?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        if customPresentView != nil {
            self.view.addSubview(customPresentView!)
        }
    }
}

extension DoPresenterVC: UIViewControllerTransitioningDelegate {
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        if presented == self {
            return DoPresentationC(presentedViewController: presented, presenting: presenting)
        }
        return nil
    }
    
    
}
