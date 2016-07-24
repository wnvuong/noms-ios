//
//  DataProvider.swift
//  noms
//
//  Created by William Vuong on 7/15/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

class DataProviderHelper {
    
    static func getRawResults(rawData: AnyObject?) -> [[String: AnyObject]]? {
        guard rawData != nil else {
            print("No raw data provided")
            return nil
        }
        
        guard let rawJSON = rawData as? [String : AnyObject] else {
            print("Invalids results returned expected root to be an object")
            return nil
        }
        
        guard let rawResults = rawJSON["result"] as? [[String: AnyObject]] else {
            print("Invalids results returned expected results to be an array of dictionary items")
            return nil
        }
        
        return rawResults
    }
    
}