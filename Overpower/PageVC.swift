//
//  PageVC.swift
//  OverPowered
//
//  Created by Bright Future on 22/07/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDataSource {
    
    var viewModel: ConversationViewModel!
    
    lazy var viewControllersToAdd: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let conversationVC = storyboard.instantiateViewController(withIdentifier: "ConversationVC")
        let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultVC")
        let helpVC = storyboard.instantiateViewController(withIdentifier: "HelpVC")
        
        return [conversationVC, resultVC, helpVC]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        setViewControllers([viewControllersToAdd[0]], direction: .forward, animated: false, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = viewControllersToAdd.index(of: viewController)
        
        let previousIndex = currentIndex! - 1
        if previousIndex >= 0 {
            return viewControllersToAdd[previousIndex]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = viewControllersToAdd.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        if nextIndex <= 2 {
            return viewControllersToAdd[nextIndex]
        } else {
            return nil
        }
    }
    
}
