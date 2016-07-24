//
//  User.swift
//  noms
//
//  Created by William Vuong on 7/22/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import UIKit

class User: NSObject {

    // MARK: Properties
    var id: String
    var firstName: String
    var lastName: String
//    var nomsLists: [NomsList]
    
    // MARK: Initialization
//    init?(id: String, firstName: String, lastName: String, nomsLists: [NomsList]) {
    init?(id: String, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        
        if id.isEmpty || firstName.isEmpty || lastName.isEmpty {
            return nil
        }
    }

}