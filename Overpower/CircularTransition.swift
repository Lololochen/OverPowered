//
//  CircularTransition.swift
//  test
//
//  Created by Bright Future on 16/09/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

class CircularTransition: NSObject {
    
    var circle = UIView()
    var startingPoint = CGPoint.zero { didSet { circle.center = startingPoint } }
    var radius: CGFloat = 0.0
    var duration = 0.4
    
    enum circularTransitionMode: Int {
        case present, dismiss
    }
    var transitionMode = circularTransitionMode.present    
}

extension CircularTransition: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        if transitionMode == .present {
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                
                let viewCenter = presentedView.center
                circle.layer.cornerRadius = circle.frame.size.width / 2
                circle.center = startingPoint
                circle.backgroundColor = UIColor.white
                circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                containerView.addSubview(circle)
                
                presentedView.center = startingPoint
                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: duration, animations: {
                    self.circle.transform = CGAffineTransform.identity
                    presentedView.transform = CGAffineTransform.identity
                    presentedView.alpha = 1
                    presentedView.center = viewCenter
                    }, completion: {(sucess: Bool) in transitionContext.completeTransition(sucess)})
            }
        } else {
            if let returningView = transitionContext.view(forKey: UITransitionContextViewKey.from) {
                let viewCenter = returningView.center
                circle.layer.cornerRadius = circle.frame.size.width / 2
                circle.center = startingPoint
                
                UIView.animate(withDuration: duration + 0.1, animations: {
                    self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.center = self.startingPoint
                    returningView.alpha = 0
                    
                    }, completion: {(success: Bool) in
                        returningView.center = viewCenter
                        returningView.removeFromSuperview()
                        self.circle.removeFromSuperview()
                        transitionContext.completeTransition(success)
                })
            }
        }
    }
}
