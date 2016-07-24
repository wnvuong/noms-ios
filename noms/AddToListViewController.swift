//
//  AddToListViewController.swift
//  noms
//
//  Created by William Vuong on 7/23/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import UIKit

class AddToListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    var nomsLists: [NomsList] = [NomsList]()
    var restaurantToAdd: Restaurant!
    
    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var nomsListsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
//        self.navigationBar.shadowImage = UIImage()
//        self.navigationBar.translucent = true
        
        self.nomsListsTableView.contentInset = UIEdgeInsetsMake(self.navigationBar.frame.size.height, 0, 0, 0)
        self.nomsListsTableView.dataSource = self
        self.nomsListsTableView.delegate = self
        
        self.nomsListsTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.fetchNomsLists()
    }
    
    func fetchNomsLists() {
        NomsListsProvider.getNomsLists({ result in
            if let resultNomsLists = result {
                self.nomsLists = resultNomsLists
                self.nomsListsTableView.reloadData()
            }
        })
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nomsLists.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "AddToListTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! AddToListTableViewCell
        
        let nomsList = nomsLists[indexPath.row]
        cell.nameLabel.text = nomsList.name
        
        for list in nomsLists {
            if list.name == nomsList.name {
                for restaurantId in list.restaurantIds {
                    if restaurantId == restaurantToAdd.id {
                        cell.nameLabel.enabled = false
                        cell.userInteractionEnabled = false
                        return cell
                    }
                }
            }
        }

        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let nomsList = self.nomsLists[indexPath.row]
        
        NomsListsAPI.updateList(nomsList.id, toAdd: [restaurantToAdd.id], toRemove: nil, completion: { result in
            self.performSegueWithIdentifier("AddToListUnwind", sender: self)
        })
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func closeModalClicked(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
