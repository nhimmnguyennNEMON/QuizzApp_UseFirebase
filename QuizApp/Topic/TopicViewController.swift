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
    
    @IBOutlet weak var tbtopic: UITableView!
    var itemTopic: [String] = ["History", "Geography", "Civic Education"]
    var topicSelec = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbtopic.register(UINib(nibName: "TestTableViewCell", bundle: nil),
                         forCellReuseIdentifier: "TestTableViewCell")
        
        tbtopic.delegate = self
        tbtopic.dataSource = self
    }
    
    func getTopic(_ title: String){
        print(title)
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
}
