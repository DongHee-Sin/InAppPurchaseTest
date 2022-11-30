//
//  InAppPurchaseTestTests.swift
//  InAppPurchaseTestTests
//
//  Created by 신동희 on 2022/11/29.
//

import XCTest
@testable import InAppPurchaseTest  // testable : 테스트 목적으로 접근제어와 관계없이 모두 접근할 수 있음


final class InAppPurchaseTestTests: XCTestCase {

    var sut: LoginViewController!  // sut : system under test (테스트를 하고자하는 클래스를 정의할 때 주로 사용함)
    
    
    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        sut.loadViewIfNeeded()  // 필요하면 loadView 시행되도록 ...
    }

    
    override func tearDownWithError() throws {
        // 다음 테스트에 영향을 미치지 않기 위해 초기화가 필요함
        sut = nil
    }

    
    // 이메일 유효성 테스트
    // TDD - Arrange, Act, Assert
    // Given, When, Then
    func testLoginViewController_validEmail_returnTrue() throws {
        
        // 테스트 객체: Given, Arrange
        sut.emailTextField.text = "jack@jack.com"
        
        // 테스트 조건/행동: When, Act
        let valid = sut.isValidEmail()
        
        // 테스트 결과: Then, Assert
        XCTAssertTrue(valid)
    }
    
    
    func testLoginViewController_InvalidPassword_returnFalse() throws {
        
        sut.passwordTextField.text = "1234"
        
        let valid = sut.isValidPassword()
        
        XCTAssertFalse(valid)
    }
    
    
    func testLoginViewController_emailTextField_ReturnNil() throws {
        
        sut.emailTextField = nil
        
        let value = sut.emailTextField
        
        XCTAssertNil(value)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
