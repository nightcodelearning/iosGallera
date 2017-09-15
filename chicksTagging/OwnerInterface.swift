//
//  OwnerInterface.swift
//  chicksTagging
//
//  Created by Inés Rojas on 9/7/17.
//  Copyright © 2017 Inés Rojas. All rights reserved.
//

import Foundation

class OwnerInterface {
    
    //MARK Properties
    
    var ownerName : String
    var ownerId: Int
    var chickenArray = [Chicken]()
    
    //MARK Initialization
    
    init(ownerName : String, ownerId:Int){
        self.ownerName = ownerName
        self.ownerId = ownerId
    }
}
