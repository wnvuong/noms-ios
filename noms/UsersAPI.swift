//
//  UsersAPI.swift
//  noms
//
//  Created by William Vuong on 7/22/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import Foundation

class UsersAPI {
    static func getUser(completion: (AnyObject?) -> Void) {
        APIHelper.get("/users/5790404a1c14c2285948de66", completion: { result in
            completion(result)
        })
    }
}