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
                completion(restaurants)
            } else {
                completion(nil)
            }
            
        })
    }
}