//
//  SettingsViewController.swift
//  noms
//
//  Created by William Vuong on 7/20/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: Properties
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.userName.text = appDelegate.currentUser!.firstName + " " + appDelegate.currentUser!.lastName
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

}
