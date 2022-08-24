//
//  TopicViewController.swift
//  QuizApp
//
//  Created by V000273 on 16/08/2022.
//

import UIKit
import Firebase
import FirebaseDatabase

class TopicViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var tbtopic: UITableView!
    
    var childFirebase: String = "1urSOD9SR3lSD7WE1SF0CqKRa7c1INR9I-iMqQgwsKvM"
    var topicQuizzFirebase: String = "History"
    var itemTopic: [String] = []
    var topicSelec: String = ""
    var cellColors = ["F0A761","FEC362","F0BB4C","E3CB92"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbtopic.register(UINib(nibName: "TestTableViewCell", bundle: nil),
                         forCellReuseIdentifier: "TestTableViewCell")
        
        tbtopic.delegate = self
        tbtopic.dataSource = self
        
        GetAPI.share.getAllQuizz(childFirebase) { ques in
            
        } topic: { topics in
            self.itemTopic = topics
            self.tbtopic.reloadData()
        }
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        backButton.addGestureRecognizer(tapGR)
        backButton.isUserInteractionEnabled = true
        
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
        if sender.state == .ended {
            self.itemTopic = []
            let clickBack = HomeViewController(nibName: "HomeViewController", bundle: nil)
            self.navigationController?.pushViewController(clickBack, animated: true)
        }
    }
    
    @IBAction func clickStart(_ sender: Any) {
        GetAPI.share.getAllQuestion(childFirebase, topicSelec) { listQues in
            let vc = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
            vc.lisQues = listQues
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
        return itemTopic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tbtopic.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as? TestTableViewCell {
            cell.lbTopic.text = itemTopic[indexPath.row]
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
        getTopic(itemTopic[indexPath.row])
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.contentView.backgroundColor = UIColor(named: cellColors[indexPath.row % cellColors.count])
    }
}
