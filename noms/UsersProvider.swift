//
//  UsersProvider.swift
//  noms
//
//  Created by William Vuong on 7/22/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

class UsersProvider {
    static func getUser(completion: (User?) -> Void) {
        UsersAPI.getUser({ rawData in
            if let rawUsers = DataProviderHelper.getRawResults(rawData) {
                
                let user = rawUsers[0]
                
                completion(User(id: user["_id"] as! String, firstName: user["firstName"] as! String, lastName: user["lastName"] as! String)!)
            } else {
                completion(nil)
            }
        })
    }
}