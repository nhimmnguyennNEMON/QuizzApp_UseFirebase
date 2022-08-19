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
        
        var childFirebase = "1urSOD9SR3lSD7WE1SF0CqKRa7c1INR9I-iMqQgwsKvM"
        var quizzFirebase = "History"
//        getAllQuizz(childFB: childFirebase, topicFB: quizzFirebase) { _data in
//            for quiz in _data{
//                if quiz.id == 1 {
//                    print(quiz.answer)
//                }
//            }
//        }
        getAllTopic(childFB: childFirebase, topicFB: quizzFirebase) { _data in
            for topic in _data{
                print(topic.topic_1)
                print(topic.topic_2)
                print(topic.topic_3)
            }
        }
        
    }
    
    @IBAction func btLogin(_ sender: Any) {
        let clickLogin = LoginViewController(nibName: "LoginViewController", bundle: nil)
        self.navigationController?.pushViewController(clickLogin, animated: true)
    }
}
