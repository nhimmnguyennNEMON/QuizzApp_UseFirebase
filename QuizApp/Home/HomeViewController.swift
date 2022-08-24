//
//  HomeViewController.swift
//  QuizApp
//
//  Created by V000273 on 17/08/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btLogin(_ sender: Any) {
        let clickLogin = TopicViewController(nibName: "TopicViewController", bundle: nil)
        self.navigationController?.pushViewController(clickLogin, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
