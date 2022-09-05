//
//  HomeViewController.swift
//  QuizApp
//
//  Created by V000273 on 17/08/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var window: UIWindow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btLogin(_ sender: Any) {
        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
}
