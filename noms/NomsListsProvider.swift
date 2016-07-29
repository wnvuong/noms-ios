//
//  NomsListsProvider.swift
//  noms
//
//  Created by William Vuong on 7/22/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

class NomsListsProvider {
    
    static func getNomsLists(completion: ([NomsList]?) -> Void) {
        UsersAPI.getUser({ rawData in
            if let rawUsers = DataProviderHelper.getRawResults(rawData) {
                
                let user = rawUsers[0]
                
                if let rawNomsLists = user["noms-lists"] as? [[String: AnyObject]] {
                    let nomsLists: [NomsList] = rawNomsLists.map({ rawNomsList in
                        let rawRestaurants = rawNomsList["restaurants"] as! [[String: AnyObject]]
                        let restaurants = rawRestaurants.map({ rawRestaurant in
                            return rawRestaurant["yelpId"] as! String
                        })
                        return NomsList(id: rawNomsList["_id"] as! String, name: rawNomsList["name"] as! String, restaurantIds: restaurants)!
                    });
                    completion(nomsLists)
                }
            } else {
                completion(nil)
            }
        })
    }
    
    static func getNomsList(id: String, completion: (NomsList?) -> Void) {
        NomsListsAPI.getList(id, completion: { rawData in
            if let rawNomLists = DataProviderHelper.getRawResults(rawData) {
                
                let rawNomList = rawNomLists[0]
                let rawRestaurants = rawNomList["restaurants"] as! [[String: AnyObject]]
                let restaurants = rawRestaurants.map({ rawRestaurant in
                    return rawRestaurant["yelpId"] as! String
                })

                completion(NomsList(id: rawNomList["_id"] as! String, name: rawNomList["name"] as! String, restaurantIds: restaurants))
            }
        })
    }
    
    static func updateNomsList(id: String, toAdd: [String]?, toRemove: [String]?, completion: (Bool) -> Void) {
        NomsListsAPI.updateList(id, toAdd: toAdd, toRemove: toRemove, completion: { rawData in
            if let rawResult = DataProviderHelper.getRawResults(rawData) {
                let status = rawResult[0]
                return completion(status["ok"] as! Double == 1)
            }
            
        })
    }
    
    static func deleteNomsList(id: String, completion: (Bool) -> Void) {
        NomsListsAPI.deleteList(id, completion: { rawData in
            if let rawResult = DataProviderHelper.getRawResults(rawData) {
                let status = rawResult[0]
                return completion(status["ok"] as! Double == 1)
            }
        })
    }
}
