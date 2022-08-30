//
//  HomeViewController.swift
//  QuizApp
//
//  Created by V000273 on 17/08/2022.
//

import UIKit
import Toast_Swift
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {
    
    let userID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btLogin(_ sender: Any) {
        let clickLogin = LoginViewController(nibName: "LoginViewController", bundle: nil)
        self.navigationController?.pushViewController(clickLogin, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        if Auth.auth().currentUser != nil {
            self.presentTopicScreen()
        }
    }
    
    
    func presentTopicScreen() {
        self.view.makeToast("Login Succcessfully!")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let vc = TopicViewController(nibName: "TopicViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
