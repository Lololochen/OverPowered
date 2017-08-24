//
//  CollectionViewAnimator.swift
//  OverPowered
//
//  Created by Bright Future on 19/12/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

class CollectionViewAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration = 0.6
    var presenting = true
    var dismissCompletion: (()->Void)?
    
    let effectView = UIVisualEffectView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        // let fromView = transitionContext.view(forKey: .from)!
        let fromVC = transitionContext.viewController(forKey: .from)
        let fromView = fromVC?.view
        let toVC = transitionContext.viewController(forKey: .to)
        let toView = toVC?.view
        
        if presenting {
            // configure blur
            effectView.frame = fromView!.bounds
            effectView.alpha = 0.9
            containerView.addSubview(effectView)
            // configure collection view
            toView!.frame = CGRect(x: 0, y: fromView!.frame.height, width: fromView!.frame.width, height: fromView!.frame.height / 1.5)
            containerView.addSubview(toView!)
            
            UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.4) {
                    toView!.center.y = fromView!.center.y
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.effectView.effect = UIBlurEffect(style: .dark)
                }
                
            }) { _ in
                transitionContext.completeTransition(true)
            }
        } else {
            
            UIView.animateKeyframes(withDuration: duration / 2, delay: 0, options: .calculationModeCubicPaced, animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.4) {
                    fromView!.frame.origin.y = containerView.frame.height
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.effectView.effect = nil
                }
                
            }) { _ in
                transitionContext.completeTransition(true)
            }
        }
    }
    
}
