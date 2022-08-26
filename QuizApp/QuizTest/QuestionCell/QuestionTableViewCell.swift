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
    var selectedIndex: IndexPath!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 12 //set corner radius here
        contentView.layer.borderWidth = 2 // set border width here
        contentView.layer.borderColor = UIColor.clear.cgColor
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            contentView.backgroundColor = UIColor.systemBlue
            answer.textColor = UIColor.white
            choice.textColor = UIColor.white
        } else {
            contentView.backgroundColor = UIColor.clear
            answer.textColor = UIColor.black
            choice.textColor = UIColor.black
        }
    }
    
}
