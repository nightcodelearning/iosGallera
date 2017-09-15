//
//  Chicken.swift
//  chicksTagging
//
//  Created by Inés Rojas on 9/7/17.
//  Copyright © 2017 Inés Rojas. All rights reserved.
//

import Foundation
import UIKit


class Chicken {
    
    
    
    // MARK Properties
    
    var ownerId : Int
    var token : String
    var image_url: String
    var owner_name : String
    var chickImage: UIImage?
    var breeder_plate_number: String
    var breeder_name: String
    var register_date: String
    var coliseo_plate_number: String
    var coliseo_responsible:String
    var weight: String
    var color: String
    var cresta: String
    var pata: String
    var search_group : Int
    

    
    //MARK Initialization
    
    init(token:String,image_url:String, owner_name:String,breeder_plate_number:String,breeder_name:String,register_date:String,coliseo_plate_number:String,coliseo_responsible:String,weight:String,color:String,cresta:String,pata:String, ownerId:Int,chickImage:UIImage?, search_group : Int) {
        self.token = token
        self.image_url = image_url
        self.owner_name = owner_name
        self.breeder_plate_number = breeder_plate_number
        self.breeder_name = breeder_name
        self.register_date = register_date
        self.coliseo_plate_number = coliseo_plate_number
        self.coliseo_responsible = coliseo_responsible
        self.weight = weight
        self.color = color
        self.cresta = cresta
        self.pata = pata
        self.ownerId = ownerId
        self.chickImage = chickImage
        self.search_group = search_group
        
    }
    

    
//    // Returns a chicken List from a dictionary
//    func getChickenList(chickenInfo: Dictionary<String,AnyObject>) -> Array<Chicken>{
//        var chickenArray = [Chicken]()
//        
//        let dic = chickenInfo.first
//        let arreglo = dic!.value as! Array<Dictionary<String,AnyObject>>
//        for (_ , element) in arreglo.enumerated() {
//            let newChicken = Chicken(token: element["token"] as! String, image_url: element["image_url"] as! String, owner_name: element["owner_name"] as! String, breeder_plate_number: element["breeder_plate_number"] as! String, breeder_name: element["token"] as! String, register_date: element["register_date"] as! String, coliseo_plate_number: element["coliseo_plate_number"] as! String, coliseo_responsible: element["coliseo_responsible"] as! String, weight: element["weight"] as! String, color: element["color"] as! String, cresta: element["cresta"] as! String, pata: element["pata"] as! String, ownerId: element["ownerId"] as! String)
//        
//                chickenArray.append(newChicken)
//
//        }
//
//        return chickenArray
//    }

}
