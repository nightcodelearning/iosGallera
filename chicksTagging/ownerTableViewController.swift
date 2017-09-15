//
//  ownerTableViewController.swift
//  chicksTagging
//
//  Created by Inés Rojas on 9/6/17.
//  Copyright © 2017 Inés Rojas. All rights reserved.
//

import UIKit
import Alamofire


class ownerTableViewController: UITableViewController {
    
    var owners = Dictionary<String,Int>()
    var chickenList = [Chicken]()
    var ownerList = [OwnerInterface]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadOwnerInfo()
        self.countList(ownerList: self.ownerList)
        
    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ownerList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ownerTableViewCell", for: indexPath) as? OwnerTableViewCell
            else{
            fatalError("Error al agregar la celda al table view")
        }
        
        let ownerFromList = ownerList[indexPath.row]
        
        cell.ownerName.text = ownerFromList.ownerName
        cell.ownerChikenAmount.text = "\(ownerFromList.chickenArray.count)"
        
        

        return cell
    }
 

    
    /**
     loads owner information from chicken Array
     */
    func loadOwnerInfo(){
        
        for (chicken) in chickenList{
            
            let ownerID = chicken.ownerId
            var ownerExists = false
            
            for owner in ownerList {
                if ownerID == owner.ownerId {
                    ownerExists = true
                    owner.chickenArray.append(chicken)
                    
                }
            }
            if !ownerExists {
                let newOwner = OwnerInterface(ownerName: chicken.owner_name, ownerId:chicken.ownerId)
                newOwner.chickenArray.append(chicken)
                self.ownerList.append(newOwner)
            }

        }
        
    }
    
    
    /**
     metodo para imprimir la lista de owners
     */
     func countList(ownerList: Array<OwnerInterface>){
        for (element) in ownerList{
            print("\(element.ownerId)  \(element.ownerName)  \(element.chickenArray.count)")
        }
    
    }
    

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "showChickenList":
            guard let chickenTableViewController = segue.destination as? ChickTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedOwnerCell = sender as? OwnerTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedOwnerCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedOwner = ownerList[indexPath.row]
            chickenTableViewController.selectedOwner = selectedOwner
            
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
            
        }
    }
    
    
    
            

    
}
    

