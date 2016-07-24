//
//  Restaurant.swift
//  noms
//
//  Created by William Vuong on 7/15/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import UIKit

class Restaurant: NSObject {
    
    // MARK: Properties
    var id: String
    var name: String
    var rating: Double
    
    var latitude: Double
    var longitude: Double
    
    // MARK: Initialization
    init?(id: String,
          name: String,
          rating: Double,
          latitude: Double,
          longitude: Double) {
        self.id = id
        self.name = name
        self.rating = rating
        
        self.latitude = latitude
        self.longitude = longitude
        
        if name.isEmpty || rating < 1 {
            return nil
        }
    }
}
