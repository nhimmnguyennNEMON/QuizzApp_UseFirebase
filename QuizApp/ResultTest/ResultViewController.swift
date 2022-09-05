//
//  ResultViewController.swift
//  QuizApp
//
//  Created by V000273 on 16/08/2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultExam: UILabel!
    @IBOutlet weak var sumQuestion: UILabel!
    @IBOutlet weak var topicExamFinal: UILabel!
    
    var resultExamDis: Int = 0
    var sumQuestionDis: Int = 0
    var titleExamTry: String = ""
    var lisQues: [Questions] = []
    var childFirebase: String = "1urSOD9SR3lSD7WE1SF0CqKRa7c1INR9I-iMqQgwsKvM"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultExam.text = String(describing: resultExamDis)
        sumQuestion.text = String(describing: sumQuestionDis)
        topicExamFinal.text = titleExamTry
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func clickTryAgain(_ sender: Any) {
        let vc = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
        vc.lisQues = lisQues
        vc.titleExam = titleExamTry
        self.setRootViewController(vc)
    }
    
    @IBAction func clickContinue(_ sender: Any) {
        let vc = TopicViewController(nibName: "TopicViewController", bundle: nil)
        self.setRootViewController(vc)
    }
}
