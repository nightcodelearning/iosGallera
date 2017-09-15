//
//  DatesTableViewCell.swift
//  chicksTagging
//
//  Created by Inés Rojas on 9/13/17.
//  Copyright © 2017 Inés Rojas. All rights reserved.
//

import UIKit

class DatesTableViewCell: UITableViewCell {

    //MARK PROPERTIES
    
    @IBOutlet weak var yearMonthLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
