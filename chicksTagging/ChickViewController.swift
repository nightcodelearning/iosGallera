//
//  ChickViewController.swift
//  chicksTagging
//
//  Created by Inés Rojas on 9/3/17.
//  Copyright © 2017 Inés Rojas. All rights reserved.
//

import Foundation
import UIKit

class ChickDetailTableViewController: UITableViewController {
    
    
    // MARK Properties
    
    @IBOutlet weak var chickImage: UIImageView!
   
    @IBOutlet weak var owner_nameLabel: UILabel!
    
    @IBOutlet weak var breeder_nameLabel: UILabel!
    
    @IBOutlet weak var breeder_plate_numberLabel: UILabel!
    
    
    @IBOutlet weak var register_dateLabel: UILabel!
    
    @IBOutlet weak var coliseo_responsibleLabel: UILabel!
    
    @IBOutlet weak var coliseo_plate_numberLabel: UILabel!
    
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var pataLabel: UILabel!

    @IBOutlet weak var crestaLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    /*
     This value is either passed by `ChickTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new chick.
     */
    
    var selectedChicken : Chicken?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let chickenDetail = selectedChicken {
            navigationItem.title = selectedChicken?.coliseo_plate_number
            chickImage.image = selectedChicken?.chickImage
            owner_nameLabel.text = selectedChicken?.owner_name
            breeder_nameLabel.text = selectedChicken?.breeder_name
            breeder_plate_numberLabel.text = selectedChicken?.breeder_plate_number
            register_dateLabel.text = selectedChicken?.register_date
            coliseo_responsibleLabel.text = selectedChicken?.coliseo_responsible
            coliseo_plate_numberLabel.text = selectedChicken?.coliseo_plate_number
            colorLabel.text = selectedChicken?.color
            pataLabel.text = selectedChicken?.pata
            crestaLabel.text = selectedChicken?.cresta
            weightLabel.text = selectedChicken?.weight
            
        
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
