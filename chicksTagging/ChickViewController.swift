//
//  ChickViewController.swift
//  chicksTagging
//
//  Created by Inés Rojas on 9/3/17.
//  Copyright © 2017 Inés Rojas. All rights reserved.
//

import Foundation
import UIKit

class ChickViewController: UIViewController {
    
    
    // MARK Properties
    
    @IBOutlet weak var propietarioText: UITextField!
    
    @IBOutlet weak var castadorText: UITextField!
    
    @IBOutlet weak var tagCastadorText: UITextField!
    
    @IBOutlet weak var TagColiseoText: UITextField!
    
    @IBOutlet weak var marcadorText: UITextField!
    
    @IBOutlet weak var fechaText: UITextField!
    
    @IBOutlet weak var chickImage: UIImageView!
    
    /*
     This value is either passed by `ChickTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new chick.
     */
    var chick: Chick?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let chick = chick {
            navigationItem.title = chick.coliseoTag
            propietarioText.text = chick.ownerName
            castadorText.text = chick.castadorName
            tagCastadorText.text = chick.castadorTag
            TagColiseoText.text = chick.coliseoTag
            marcadorText.text = chick.taggerName
            
            let formatter = DateFormatter()
            // initially set the format based on your datepicker date
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let myString = formatter.string(from: chick.registerDate)
            // convert your string to date
            let yourDate = formatter.date(from: myString)
            //then again set the date format whhich type of output you need
            formatter.dateFormat = "dd-MMM-yyyy"
            // again convert your date to string
            let myStringafd = formatter.string(from: yourDate!)
            
            fechaText.text = myStringafd
            chickImage.image = chick.chickImage
            
        }
        
    }
    
    
    //MARK Navigation

    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
    }
    
    
    @IBAction func saveChick(_ sender: UIBarButtonItem) {
    }
}
