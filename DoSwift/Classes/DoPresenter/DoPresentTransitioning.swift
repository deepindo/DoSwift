//
//  DoPresentTransitioning.swift
//  DoKit
//
//  Created by deepin do on 2020/4/26.
//

import UIKit

open class DoPresentTransitioning: NSObject {

    public let isPresenting: Bool
    
    public let transitionDuration: TimeInterval
    
    public let dismissHeight: CGFloat?
        
    init(isPresenting: Bool, transitionDuration: TimeInterval, dismissHeight: CGFloat? = nil) {
        self.isPresenting = isPresenting
        self.transitionDuration = transitionDuration
        self.dismissHeight = dismissHeight
        super.init()
    }
}

extension DoPresentTransitioning: UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            
        } else {

        }
    }
}
