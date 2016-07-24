//
//  RestaurantDetailViewController.swift
//  noms
//
//  Created by William Vuong on 7/22/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import UIKit
import CoreLocation

class RestaurantDetailViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: Properties
    var restaurant: Restaurant!

    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let locationManger = CLLocationManager()

    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.latitudeLabel.text = String(format: "%f", restaurant.latitude)
        self.longitudeLabel.text = String(format: "%f", restaurant.longitude)
        self.idLabel.text = restaurant.id
        self.initLocationManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initLocationManager() {
        self.locationManger.delegate = self
        self.locationManger.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManger.startUpdatingLocation()
    }
    
    func updateDistanceAway(manager: CLLocationManager) {
        if let myLocation = manager.location {
            let restaurantLocation = CLLocation(latitude: restaurant.latitude, longitude: restaurant.longitude)
            let distance: CLLocationDistance = restaurantLocation.distanceFromLocation(myLocation)
            self.distanceLabel.text = String(format: "%.1f miles away", distance * 0.000621371192)
        }
    }
    
    // MARK: - Location Manager Delegate
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.updateDistanceAway(manager)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddToListSegue" {
            if let destination = segue.destinationViewController as? AddToListViewController {
                destination.restaurantToAdd = self.restaurant
            }
        }
    }
    
    @IBAction func unwindToRestaurantDetailViewController(segue: UIStoryboardSegue) {
        if segue.sourceViewController is AddToListViewController {
            self.appDelegate.loadUser(nil)
        }
    }

}
