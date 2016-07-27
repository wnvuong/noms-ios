//
//  RestaurantsAPI.swift
//  noms
//
//  Created by William Vuong on 7/22/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import Foundation

class RestaurantsAPI {
    static func getRestaurants(completion: (AnyObject?) -> Void) {
        APIHelper.get("/restaurants", completion: { result in
            completion(result)
        })
    }
    
    static func getRestaurant(id: String, completion: (AnyObject?) -> Void) {
        APIHelper.get("/restaurants/" + id, completion: { result in
            completion(result)
        })
    }
}