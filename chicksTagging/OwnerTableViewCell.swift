//
//  OwnerTableViewCell.swift
//  chicksTagging
//
//  Created by Inés Rojas on 9/7/17.
//  Copyright © 2017 Inés Rojas. All rights reserved.
//

import UIKit

class OwnerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ownerImage: UIImageView?
    
    @IBOutlet weak var ownerName: UILabel!
    
    @IBOutlet weak var ownerChikenAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
