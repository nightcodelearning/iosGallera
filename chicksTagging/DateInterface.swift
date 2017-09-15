//
//  DateInterface.swift
//  chicksTagging
//
//  Created by Inés Rojas on 9/13/17.
//  Copyright © 2017 Inés Rojas. All rights reserved.
//

import Foundation
import UIKit

class DateInterface {
    
    
    //MARK properties
    
    var date_id: Int
    var date_token : String
    var group_date : String
    var date_created : Date?
    var count : Int
    
    init?(date_id:Int, date_token: String, group_date: String, date_created : Date?, count:Int){
        self.date_id = date_id
        self.date_token = date_token
        self.group_date = group_date
        self.date_created = date_created
        self.count = count
    
    }
}
