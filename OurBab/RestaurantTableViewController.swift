//
//  RestaurantTableViewController.swift
//  OurBab
//
//  Created by TChoi on 2016. 10. 25..
//  Copyright © 2016년 T. Choi. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Seo Galbi", "OB Bear", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["seogalbi.jpg", "obbear.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg"]
    
    var restaurantLocations = ["Seoul", "Seoul", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["BBQ", "Bar", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // There is one section
        return 1 //<--- 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Total number of restaurants as stored in the array, numberOfSectionsInTableView method is optional. If you remove it, the table view still works because the number of sections is set to 1 by default.
        return restaurantNames.count  // <---- 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        // let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // Configure the cell... just display the restaurant names and images
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        /*if restaurantIsVisited[indexPath.row] {
         cell.accessoryType = .checkmark } else {
         cell.accessoryType = .none }*/
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // Create an option menu as an action sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet) //.alert
//        
//        // Add actions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        
//        // Add Call action
//        let callActionHandler = {
//            (action:UIAlertAction!) -> Void in
//            
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
//            
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//        
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//        
//        // Check-in action
//        // Determine the check in title. If the selected restaurant has been checked (i.e.
//        // restaurantIsVisited[indexPath.row] returns true), the title will be set to "Undo Check in".
//        
//        let checkInTitle = restaurantIsVisited[indexPath.row] ? "Undo Check in" : "Check in"
//        let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
//            
//            let cell = tableView.cellForRow(at: indexPath)
//            // Toggle check-in and undo-check-in
//            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
//            
//            //cell?.accessoryType = .checkmark
//            //self.restaurantIsVisited[indexPath.row] = true
//            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
//            
//        })
//        
//        optionMenu.addAction(checkInAction)
//        
//        tableView.deselectRow(at: indexPath, animated: false)
//        
//        // Display the menu
//        present(optionMenu, animated: true, completion: nil)
//    }
    
    // Delete the row from the data source
    override func tableView(_ tableView: UITableView, commit editingStyle:  UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // editingStyle: enum: none, delete, insert
        
        if editingStyle == .delete {
            restaurantNames.remove(at: indexPath.row)
            restaurantLocations.remove(at: indexPath.row)
            restaurantTypes.remove(at: indexPath.row)
            restaurantIsVisited.remove(at: indexPath.row)
            restaurantImages.remove(at: indexPath.row)
            
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style:
            UITableViewRowActionStyle.default, title: "Share", handler: { (action, indexPath) -> Void in
                
                let defaultText = "Just checking in at " +
                    self.restaurantNames[indexPath.row]
                
                if let imageToShare = UIImage(named:
                    self.restaurantImages[indexPath.row]) {
                    let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                    self.present(activityController, animated: true, completion: nil)
                }
        })
        
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete",handler: { (action, indexPath) -> Void in
            
            // Delete the row from the data source
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
        
    }
    
    
    
    
    
    
}
