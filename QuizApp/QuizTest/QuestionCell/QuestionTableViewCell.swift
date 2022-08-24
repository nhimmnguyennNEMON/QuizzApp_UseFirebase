//
//  QuestionTableViewCell.swift
//  QuizApp
//
//  Created by V000273 on 24/08/2022.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var choice: UILabel!
    @IBOutlet weak var cvQuestion: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cvQuestion.layer.cornerRadius = 10
        cvQuestion.layer.masksToBounds = true

        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            contentView.backgroundColor = UIColor.systemBlue
        } else {
            contentView.backgroundColor = UIColor.clear
        }
    }
    
}
