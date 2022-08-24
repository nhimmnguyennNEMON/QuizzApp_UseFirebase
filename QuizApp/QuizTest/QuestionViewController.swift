//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by V000273 on 16/08/2022.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var tableQuesstion: UITableView!
    var lisQues: [Questions] = []
    var choiceData: [String] = ["A", "B", "C", "D"]
    var answerData: [String] = ["Có dân số đông nhất so với các vùng khác trong cả nước.", "Có diện tích rộng nhất so với các vùng khác trong cả nước.", "Có kinh tế phát triển nhất.", "Tiếp giáp với Trung Quốc và Campuchia."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableQuesstion.register(UINib(nibName: "QuestionTableViewCell", bundle: nil),
                         forCellReuseIdentifier: "QuestionTableViewCell")
        
        tableQuesstion.delegate = self
        tableQuesstion.dataSource = self
        print(lisQues)
           
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}

extension QuestionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableQuesstion.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as? QuestionTableViewCell {
            cell.choice.text = choiceData[indexPath.row]
            cell.answer.text = answerData[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
