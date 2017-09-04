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
    
    var chickList = [Chick]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadChiklist()


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
        return chickList.count
    }

    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "chickTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ChickTableViewCell
            else{
                fatalError("Error al agregar la celda al table view")
        }
        
        let chickFromList = chickList[indexPath.row]
        
    
        Alamofire.request(chickFromList.chickImageURL).responseImage { response in
            
            if let image = response.result.value {
                
//                let size = CGSize(width: 90.0, height: 90.0)
                
                // Scale image to size disregarding aspect ratio
//                let scaledImage = image.af_imageScaled(to: size)
                cell.chickImageView.image = image
                chickFromList.chickImage = image
                cell.ownerLabel.text = chickFromList.ownerName
                cell.coliseoTagLabel.text = chickFromList.coliseoTag
                cell.castadorTagLabel.text = chickFromList.castadorTag
            }
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
     //MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
        os_log("Adding a new chick.", log: OSLog.default, type: .debug)
        
        case "ShowDetail":
        guard let chickDetailViewController = segue.destination as? ChickViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }

        guard let selectedChickCell = sender as? ChickTableViewCell else {
            fatalError("Unexpected sender: \(sender)")
        }

        guard let indexPath = tableView.indexPath(for: selectedChickCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }

        let selectedChick = chickList[indexPath.row]
        chickDetailViewController.chick = selectedChick

        default:
        fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
        
        
        
    }
    
    
    
    //Mark: Private Methods
    
    private func loadChiklist(){

        //let image = UIImage(named: "DefaultImage")
        
        let chick1 = Chick(chickImageURL: "https://httpbin.org/image/png", ownerName: "Dario  R", registerDate: Date(), castadorTag: "Aw-103", castadorName: "peter parker", coliseoTag: "123-456", taggerName: "Homero simpson",chickImage :UIImage())
        
        let chick2 = Chick(chickImageURL: "https://httpbin.org/image/png", ownerName: "Ines Rojas", registerDate: Date(), castadorTag: "AT-Walker", castadorName: "peter parker", coliseoTag: "R2D2", taggerName: "Homero simpson",chickImage :UIImage())
        
        chickList.append(chick1!)
        chickList.append(chick2!)
        
        

        
    }
    
    
  
    
    
    

}
