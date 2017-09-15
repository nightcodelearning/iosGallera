//
//  DateListTableViewController.swift
//  chicksTagging
//
//  Created by Inés Rojas on 9/13/17.
//  Copyright © 2017 Inés Rojas. All rights reserved.
//

import UIKit
import Alamofire


class DateListTableViewController: UITableViewController {

    //MARK Properties
    
    var datesArray = Array<DateInterface>()
    var chickenArray = Array<Chicken>()
    
    
    @IBOutlet var myDatesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDateInfo()
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
        return datesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "datesCell", for: indexPath) as? DatesTableViewCell
            else{
                fatalError("Error al agregar la celda al table view")
        }
        
        let dateFromList = datesArray[indexPath.row]
        
        cell.yearMonthLabel.text = dateFromList.group_date
        cell.countLabel.text = String(dateFromList.count)
        
        
        return cell
    }
    

    
    func loadDateInfo(){
        
        Alamofire.request("https://gallera.herokuapp.com//api/gallera/v1/get_chick").validate().responseJSON { response in
            switch response.result {
            case .success:
                print("validation OK")
                
                if let dataDownloaded = response.data{
                    
                    do{
                        
                        let newJsonData = try JSONSerialization.jsonObject(with: dataDownloaded , options: .mutableContainers) as! Dictionary <String , AnyObject>

                        // get Dates From JSON
                        let datesDictionary = newJsonData["dates"] as! Array<AnyObject>
                        
                        for element in datesDictionary{
                                
                            let fecha = element["date_created"] as! String
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
                            let newDate = dateFormatter.date(from: fecha)
                            let date_id = element["id"] as! Int
                            let date_token = element["token"] as! String
                            let date_group_date = element["group_date"] as! String
                            let date_count = element["count"] as! Int
                            
                            
                            let dateInterface = DateInterface (
                                date_id: date_id, date_token: date_token, group_date: date_group_date, date_created: newDate, count:date_count
                            )
                            
                            self.datesArray.append(dateInterface!)
                        }
                        
                        //TableView Reload
                        
                        self.myDatesTableView.reloadData()
                        self.myDatesTableView.reloadSectionIndexTitles()
                        
                        
                        //get chickens from JSON
                        
                        let chickenDictionary = newJsonData["chickens"] as! Array<AnyObject>
                        
                        for element in chickenDictionary{
                            
                            let chickenToken = element["token"] as! String
                            let chicken_image_url = element["image_url"] as! String
                            let chicken_owner_name = element["owner_name"] as! String
                            let chicken_breeder_plate_number = element["breeder_plate_number"] as! String
                            let chicken_breeder_name = element["breeder_name"] as! String
                            let chicken_register_date = element["date_created"] as! String
                            let chicken_coliseo_plate_number = element["coliseo_plate_number"] as! String
                            let chicken_coliseo_responsible = element["coliseo_responsible"] as! String
                            let chicken_weigth = element["weight"] as! String
                            let chicken_color = element["color"] as! String
                            let chicken_cresta = element["cresta"] as! String
                            let chicken_pata = element["pata"] as! String
                            let chicken_ownerId = element["owner_id"] as! Int
                            let chicken_search_group = element["search_group"] as! Int
                            
                            
                            
                            
                            let newChicken = Chicken(token: chickenToken, image_url: chicken_image_url, owner_name: chicken_owner_name, breeder_plate_number: chicken_breeder_plate_number, breeder_name: chicken_breeder_name , register_date: chicken_register_date, coliseo_plate_number: chicken_coliseo_plate_number , coliseo_responsible: chicken_coliseo_responsible, weight: chicken_weigth, color: chicken_color, cresta: chicken_cresta, pata: chicken_pata, ownerId: chicken_ownerId, chickImage: nil,search_group: chicken_search_group)
                                
                                
                            self.chickenArray.append(newChicken)
                        
                            
                        }
            
                    }catch {print("error")}
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    // MARK Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "showOwnerList":
            guard let ownerTableViewController = segue.destination as? ownerTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedOwnerCell = sender as? DatesTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedOwnerCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedDate  = datesArray[indexPath.row]
            
            let filteredChickenArray = chickenArray.filter{$0.search_group == selectedDate.date_id}
            
            ownerTableViewController.chickenList = filteredChickenArray
            
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
            
        }
    }

    
    

}
