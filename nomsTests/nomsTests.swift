//
//  nomsTests.swift
//  nomsTests
//
//  Created by William Vuong on 7/15/16.
//  Copyright © 2016 William Vuong. All rights reserved.
//

import XCTest
@testable import noms

class nomsTests: XCTestCase {
    
    // MARK: noms Tests
    
    // Tests to confirm that the Restaurant initializer returns when no name or a negative rating is provided
    func testRestaurantInitialization() {
        
        // Success case
        let potentialItem = Restaurant(name: "Lunch and Supper", rating: 4.5)
        XCTAssertNotNil(potentialItem)
        
        // Failure cases
        let noName = Restaurant(name: "", rating: 1)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Restaurant(name: "Lunch and Supper", rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
    }
    
}
