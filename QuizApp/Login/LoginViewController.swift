//
//  LoginViewController.swift
//  QuizApp
//
//  Created by V000273 on 16/08/2022.
//

import UIKit
import Toast_Swift
import PowerplayToastKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var btLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tabOnLogin(_ sender: Any) {
        view.endEditing(true)
        if email.text == "" || pass.text == "" {
            //validate
//            PowerplayToastKit
//                .shared
//                .showToast(of: .warning(title: "Warning", message: "Please enter all email and password"), at: .center, for: 5)
            return
            self.view.makeToast("Please enter all Email and Password")
        } else {
            //check account
            Auth.auth().signIn(withEmail: email.text!, password: pass.text!) { [weak self] authData, error in
                if error != nil{
                    self?.view.makeToast(error!.localizedDescription)
                } else{
                    authData?.user.reload(completion: { (error) in
                        if (authData?.user.isEmailVerified)! {
                            self?.view.makeToast("Login Succcessfully!")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                let vc = TopicViewController(nibName: "TopicViewController", bundle: nil)
                                self?.navigationController?.pushViewController(vc, animated: true)
                            }
                        }
                    })
                }
            }
        }
    }
    @IBAction func cliickRegister(_ sender: Any) {
        let clickLogin = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController(clickLogin, animated: true)
    }
}
