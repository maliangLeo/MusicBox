//
//  NavigationViewController.swift
//  RxDemo
//
//  Created by maliang on 2019/9/5.
//  Copyright © 2019 maliang. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let interactivePopGes = interactivePopGestureRecognizer else {return}
        guard let interactivePopView = interactivePopGes.view else {return}
        
        guard let targets = interactivePopGes.value(forKey: "_targets") as? [NSObject] else {return}
        guard let target = targets.first?.value(forKey: "target") else {return}
        
        let action = Selector(("handleNavigationTransition:"))
        
        let pan = UIPanGestureRecognizer()
        interactivePopView.addGestureRecognizer(pan)
        pan.addTarget(target, action: action)
        pan.delegate = self
        
        navigationBar.barTintColor = UIColor("171823")
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension NavigationViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if viewControllers.count <= 1 {
            return false
        }
        
        if (self.value(forKey: "_isTransitioning") as? Bool ?? false) {
            return false
        }
        
        let translation = gestureRecognizer.location(in: gestureRecognizer.view)
        if translation.x <= 0 {
            return false
        }
        return true
    }
    
}






