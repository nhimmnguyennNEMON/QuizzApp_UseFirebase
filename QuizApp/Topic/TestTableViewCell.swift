//
//  TestTableViewCell.swift
//  QuizApp
//
//  Created by V000273 on 23/08/2022.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var viewTopic: UIView!
    @IBOutlet weak var lbTopic: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lbTopic.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
