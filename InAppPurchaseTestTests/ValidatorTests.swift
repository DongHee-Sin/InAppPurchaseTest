//
//  ValidatorTests.swift
//  InAppPurchaseTestTests
//
//  Created by 신동희 on 2022/11/30.
//

import XCTest
@testable import InAppPurchaseTest


final class ValidatorTests: XCTestCase {
    
    var sut: Validator!

    
    override func setUpWithError() throws {
        sut = Validator()
    }

    
    override func tearDownWithError() throws {
        sut = nil
    }

    
    func testValidator_validEmail_returnTrue() throws {
        let user = User(email: "jack@jack.com", password: "1234", check: "1234")
        
        let valid = sut.isValidEmail(email: user.email)
        
        XCTAssertTrue(valid)
    }

    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
