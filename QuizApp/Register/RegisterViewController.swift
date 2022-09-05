//
//  RegisterViewController.swift
//  QuizApp
//
//  Created by V000273 on 18/08/2022.
//

import UIKit
import Toast_Swift
import PowerplayToastKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pass.isSecureTextEntry.toggle()
    }


    @IBAction func clickRegister(_ sender: Any) {
        view.endEditing(true)
        if email.text == "" || pass.text == "" {
            self.view.makeToast("Please enter all Email and Password")
        } else {
            //check account
            Auth.auth().createUser(withEmail: email.text!, password: pass.text!) { (authData, error) in
                if error != nil{
                    self.view.makeToast(error!.localizedDescription)
                }
                authData?.user.sendEmailVerification(completion: { (error) in
                    if error != nil {
                            self.view.makeToast(error!.localizedDescription)
                    } else {
                            self.view.makeToast("Send email verify!")
                    }
                })
            }
        }
    }
}

extension UITextField {
    func togglePasswordVisibility() {
        isSecureTextEntry = !isSecureTextEntry

        if let existingText = text, isSecureTextEntry {
            deleteBackward()
            if let textRange = textRange(from: beginningOfDocument, to: endOfDocument) {
                replace(textRange, withText: existingText)
            }
        }
        if let existingSelectedTextRange = selectedTextRange {
            selectedTextRange = nil
            selectedTextRange = existingSelectedTextRange
        }
    }
}
