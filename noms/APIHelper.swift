//
//  DataAPI.swift
//  noms
//
//  Created by William Vuong on 7/15/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import Alamofire

class APIHelper {
    
    static private let baseUrl = "https://api.getnoms.com/api"
    
    static private func getRawResult(response: Response<AnyObject, NSError>) -> [String: AnyObject]? {
        guard response.result.isSuccess else {
            print("Error while fetching restaurants: \(response.result.error)")
            return nil
        }
        
        guard let rawResult = response.result.value as? [String: AnyObject] else {
            print("Invalids results returned expected root to be an object")
            return nil
        }
        
        guard rawResult["status"] as! String == "success" else {
            print("Request failed")
            return nil
        }
        
        return rawResult;
    }
    
    static func get(urlPath: String, completion: (AnyObject?) -> Void) {
        
        Alamofire.request(.GET, APIHelper.baseUrl + urlPath)
            .validate()
            .responseJSON(completionHandler: { response in
                let rawResult = APIHelper.getRawResult(response)
                
                completion(rawResult)
            }
        )
    }

    static func put(urlPath: String, parameters: [String: AnyObject], completion: (AnyObject?) -> Void) {
        
        Alamofire.request(.PUT, APIHelper.baseUrl + urlPath, parameters: parameters, encoding: .JSON)
            .responseJSON(completionHandler: { response in
                let rawResult = APIHelper.getRawResult(response)
                
                print(rawResult)
                completion(rawResult)
            })
    }
    
    static func delete(urlPath: String, completion: (AnyObject?) -> Void) {
    
        Alamofire.request(.DELETE, APIHelper.baseUrl + urlPath)
            .responseJSON(completionHandler: { response in
                let rawResult = APIHelper.getRawResult(response)
                
                completion(rawResult)
            })
    }

}
