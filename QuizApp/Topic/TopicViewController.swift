//
//  TopicViewController.swift
//  QuizApp
//
//  Created by V000273 on 16/08/2022.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class TopicViewController: UIViewController {
    
    static var share = TopicViewController()
    
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var tbtopic: UITableView!
    @IBOutlet weak var btStart: UIButton!
    
    var childFirebase: String = "1urSOD9SR3lSD7WE1SF0CqKRa7c1INR9I-iMqQgwsKvM"
    var itemTopic: [String] = []
    var topicSelec: String = ""
    var cellColors = ["F0A761","FEC362","F0BB4C","E3CB92"]
    
    var listExam: [Exam] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbtopic.register(UINib(nibName: "TestTableViewCell", bundle: nil),
                         forCellReuseIdentifier: "TestTableViewCell")
        
        tbtopic.delegate = self
        tbtopic.dataSource = self
        
        GetAPI.share.getAllQuizz(childFirebase) { examDatas in
            self.listExam = examDatas
            self.tbtopic.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        
    }
    
    func displayAlert() {
        let dialogMessage = UIAlertController(title: "Xác Nhận!", message: "Bạn Có Muốn LogOut Không?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Có", style: .default, handler: { (action) -> Void in
            do {
                try FirebaseAuth.Auth.auth().signOut()
                let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
                self.setRootViewController(vc)
            }
            catch{
                print("LogOut Error")
            }
        })
        let cancel = UIAlertAction(title: "Không", style: .cancel) { (action) -> Void in
            
        }
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    @IBAction func btLogout(_ sender: Any) {
        displayAlert()
    }
    
    @IBAction func clickStart(_ sender: Any) {
        if topicSelec == "" {
            btStart.isEnabled = false
        } else {
            getAllQuiz(childFirebase, topicSelec)
        }
    }
    
    func getAllQuiz(_ childFB: String, _ topicFB: String){
        GetAPI.share.getAllQuestion(childFB, topicFB) { listQues in
            let vc = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
            vc.lisQues = listQues
            vc.titleExam = self.topicSelec
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func getTopic(_ title: String){
        if title.contains("History"){
            topicSelec = "History"
        }
        if title.contains("Geography"){
            topicSelec = "Geography"
        }
        if title.contains("Civic Education"){
            topicSelec = "Civic Education"
        }
    }
    
} 

extension TopicViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listExam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tbtopic.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as? TestTableViewCell {
            cell.lbTopic.text = listExam[indexPath.row].title
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getTopic(listExam[indexPath.row].title ?? "")
        btStart.isEnabled = true
    }
    
    private func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.contentView.backgroundColor = UIColor(named: cellColors[indexPath.row % cellColors.count])
    }
}
