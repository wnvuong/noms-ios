//
//  RestaurantsProvider.swift
//  noms
//
//  Created by William Vuong on 7/22/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

class RestaurantsProvider {
    
    static func getRestaurants(completion: ([Restaurant]?) -> Void) {
        RestaurantsAPI.getRestaurants({ rawData in
            
            if let rawRestaurants = DataProviderHelper.getRawResults(rawData) {
                let restaurants: [Restaurant] = rawRestaurants.map({ dict in
                    let coordinate = dict["coordinate"] as! [String: AnyObject]
                    return Restaurant(
                        id: dict["id"] as! String,
                        name: dict["name"] as! String,
                        rating: dict["rating"] as! Double,
                        latitude: coordinate["latitude"] as! Double,
                        longitude: coordinate["longitude"] as! Double)!
                })
                return completion(restaurants)
            }
            return completion(nil)
        })
    }
    
    static func getRestaurant(id: String, completion: (Restaurant?) -> Void) {
        RestaurantsAPI.getRestaurant(id, completion: { rawData in
            if let rawRestaurants = DataProviderHelper.getRawResults(rawData) {
                let rawRestaurant = rawRestaurants[0]
                if let coordinate: [String: Double] = rawRestaurant["coordinate"] as? [String: Double] {
                    return completion(Restaurant(id: rawRestaurant["id"] as! String, name: rawRestaurant["name"] as! String, rating: rawRestaurant["rating"] as! Double, latitude: coordinate["latitude"]!, longitude: coordinate["longitude"]!))
                }
            }
            return completion(nil)
        })
    }
}