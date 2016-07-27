
//
//  NomsListTableViewController.swift
//  noms
//
//  Created by William Vuong on 7/22/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import UIKit

class SingleNomsListTableViewController: UITableViewController {

    // MARK: Properties
    var nomsListId: String?
    var nomsList: NomsList?
    var loadedRestaurants: [String: Restaurant] = [String: Restaurant]()
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.fetchNomsList()
    }
    
    func fetchNomsList() {
        NomsListsProvider.getNomsList(nomsListId!, completion: { result in
            if let resultNomsList = result {
                self.nomsList = resultNomsList
                for restaurantId in self.nomsList!.restaurantIds {
                    RestaurantsProvider.getRestaurant(restaurantId, completion: { result in
                        self.loadedRestaurants[restaurantId] = result
                    })
                }
                self.tableView.reloadData()
            }
        })
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let currNomsList = nomsList {
            return currNomsList.restaurantIds.count
        } else {
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let currNomsList = nomsList {
            let cellIdentifier = "SingleNomsListTableViewCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SingleNomsListTableViewCell
            
            let restaurantId = currNomsList.restaurantIds[indexPath.row]
            
            
            if self.loadedRestaurants[restaurantId] != nil {
                cell.nameLabel.text = self.loadedRestaurants[restaurantId]?.name
            } else {
//                cell.nameLabel.text = restaurantId
                RestaurantsProvider.getRestaurant(restaurantId, completion: { result in
                    self.loadedRestaurants[restaurantId] = result
                    if result != nil {
//                        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                        cell.nameLabel.text = result!.name
                    }
                    
                    
                })
            }
            
            return cell
        } else {
            return UITableViewCell(style: .Default, reuseIdentifier: "DefaultCell")
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
