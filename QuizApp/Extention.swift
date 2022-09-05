//
//  Extention.swift
//  QuizApp
//
//  Created by V000273 on 05/09/2022.
//

import Foundation
import UIKit

extension UINavigationController {
    func popToRootViewController(_ completion: (() -> Void)? = nil) {
        if self.navigationController != nil && !self.isEqual(self.navigationController?.viewControllers.first) {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            self.navigationController?.popToRootViewController(animated: false)
            CATransaction.commit()
            
        }
    }
    
    func makeKeyAndVisible() {
        func present(window: UIWindow) {
            window.setAsRootViewController()
        }
        
        guard let window = UIApplication.shared.keyWindow else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            (UIApplication.shared.delegate as? AppDelegate)?.window = window
            present(window: window)
            
            return
        }
        
        present(window: window)
    }
    
}

extension UIWindow {
    func setAsRootViewController() {
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.makeKeyAndVisible()
    }
}

extension UIViewController {
    func setRootViewController(_ vc: UIViewController){
        let navigationController = UINavigationController(rootViewController: vc)
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
