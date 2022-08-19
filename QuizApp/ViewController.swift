//
//  ViewController.swift
//  QuizApp
//
//  Created by V000273 on 16/08/2022.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
    let dbFireBase = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        
    }
    

}

