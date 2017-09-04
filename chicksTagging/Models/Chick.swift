//
//  Chick.swift
//  chicksTagging
//
//  Created by Inés Rojas on 8/28/17.
//  Copyright © 2017 Inés Rojas. All rights reserved.
//

import Foundation
import UIKit


class Chick {
    
    
    // MARK Properties
    
    var chickImage: UIImage?
    var chickImageURL: String
    var ownerName : String
    var registerDate: Date
    var castadorTag: String
    var castadorName: String
    var coliseoTag: String
    var taggerName: String
    
    //MARK Initialization
    
    init?(chickImageURL: String,ownerName:String, registerDate: Date,castadorTag:String,castadorName:String,coliseoTag:String, taggerName:String, chickImage: UIImage?){
        self.chickImageURL = chickImageURL
        self.ownerName = ownerName
        self.registerDate = registerDate
        self.castadorTag = castadorTag
        self.castadorName = castadorName
        self.coliseoTag = coliseoTag
        self.taggerName = taggerName
        self.chickImage = chickImage
    }
    
    
    
}
