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
        
        let childFirebase: String = "1urSOD9SR3lSD7WE1SF0CqKRa7c1INR9I-iMqQgwsKvM"
        var topicQuizzFirebase: String = ""
        
        
        GetAPI.share.getAllTopic(childFirebase) { data in
//            print(data?.geography)
        }
        
    }
    
    @IBAction func btLogin(_ sender: Any) {
        let clickLogin = LoginViewController(nibName: "LoginViewController", bundle: nil)
        self.navigationController?.pushViewController(clickLogin, animated: true)
    }
}
