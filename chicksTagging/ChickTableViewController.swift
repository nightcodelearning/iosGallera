//
//  ChickTableViewController.swift
//  chicksTagging
//
//  Created by Inés Rojas on 8/28/17.
//  Copyright © 2017 Inés Rojas. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import os.log

class ChickTableViewController: UITableViewController {

    //MARK: Properties
    
    var selectedOwner = OwnerInterface(ownerName: "", ownerId: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return selectedOwner.chickenArray.count
    }

    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "chickTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ChickTableViewCell
            else{
                fatalError("Error al agregar la celda al table view")
        }
        
        let chickFromList = selectedOwner.chickenArray[indexPath.row]
        
    
        Alamofire.request(chickFromList.image_url).responseImage { response in
            
            if let image = response.result.value {
                
                cell.chickImageView.image = image
                chickFromList.chickImage = image
                cell.ownerLabel.text = chickFromList.owner_name
                cell.coliseoTagLabel.text = chickFromList.coliseo_plate_number
                cell.castadorTagLabel.text = chickFromList.breeder_plate_number
            }
        }
        return cell
    }
    



    
     //MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {

        
        case "ShowChickenDetail":
        guard let chickDetailViewController = segue.destination as? ChickDetailTableViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }

        guard let selectedChickCell = sender as? ChickTableViewCell else {
            fatalError("Unexpected sender: \(sender)")
        }

        guard let indexPath = tableView.indexPath(for: selectedChickCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }

        let selectedChick = selectedOwner.chickenArray[indexPath.row]
        chickDetailViewController.selectedChicken = selectedChick

        default:
        fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
        
        
        
    }
    
   
    
    
}
