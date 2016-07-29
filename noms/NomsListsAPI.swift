//
//  NomsListsAPI.swift
//  noms
//
//  Created by William Vuong on 7/22/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import Foundation

class NomsListsAPI {
    static func updateList(id: String, toAdd:[String]?, toRemove: [String]?, completion: (AnyObject)? -> Void) {
        
        var parameters = [String: AnyObject]()
        
        if (toAdd != nil) {
            parameters["add"] = toAdd!.map({ yelpId in
                return ["yelpId" : yelpId]
            })
        }
        
        if (toRemove != nil) {
            parameters["remove"] = toRemove!.map({ yelpId in
                return ["yelpId" : yelpId]
            })
        }
        
        APIHelper.put("/nomslists/" + id, parameters: parameters, completion: { result in
            completion(result)
        })
    }
    
    static func getList(id: String, completion: (AnyObject)? -> Void) {
        APIHelper.get("/nomslists/" + id, completion: { result in
            completion(result)
        })
    }
    
    static func deleteList(id: String, completion: (AnyObject)? -> Void) {
        APIHelper.delete("/nomslists/" + id, completion: { result in
            completion(result)
        })
    }
}