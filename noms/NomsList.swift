//
//  NomsList.swift
//  noms
//
//  Created by William Vuong on 7/22/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import UIKit

class NomsList: NSObject {
    
    // MARK: Properties
    var id: String
    var name: String
    var restaurantIds: [String]
    
    // MARK: Initialization
    init?(id: String, name: String, restaurantIds: [String]) {
        
        self.id = id
        self.name = name
        self.restaurantIds = restaurantIds
        
        if id.isEmpty || name.isEmpty {
            return nil
        }
    }
}
