//
//  ChickTableViewCell.swift
//  chicksTagging
//
//  Created by Inés Rojas on 8/28/17.
//  Copyright © 2017 Inés Rojas. All rights reserved.
//

import UIKit

class ChickTableViewCell: UITableViewCell {

    
    @IBOutlet weak var chickImageView: UIImageView!
    
  
    @IBOutlet weak var ownerLabel: UILabel!
    
    @IBOutlet weak var coliseoTagLabel: UILabel!
    
    @IBOutlet weak var castadorTagLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
