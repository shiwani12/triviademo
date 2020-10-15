//
//  QuestionTVC.swift
//  Trivia App
//
//  Created by Shiwani manhas on 13/10/20.
//  Copyright © 2020 Shiwani manhas. All rights reserved.
//

import UIKit

class QuestionTVC: UITableViewCell {
    //MARK:- OUTLETS
    @IBOutlet weak var lblQuestion2: UILabel!
    @IBOutlet weak var lblQuestion1: UILabel!
    //MARK:- OVERRIDE FUNCTION
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
