//
//  SavedRestaurantDetailViewController.swift
//  noms
//
//  Created by William Vuong on 7/26/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import UIKit

class SavedRestaurantDetailViewController: UIViewController {

    // MARK: Properties
    var nomsListId: String!
    var savedRestaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func removeSavedRestaurantClicked(sender: NomsBaseButton) {
        NomsListsProvider.updateNomsList(nomsListId, toAdd: nil, toRemove: [savedRestaurant.id], completion: { result in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
    }
    
    @IBAction func closedSavedRestaurantDetail(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
