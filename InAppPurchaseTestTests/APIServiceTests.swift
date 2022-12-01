//
//  APIServiceTests.swift
//  InAppPurchaseTestTests
//
//  Created by 신동희 on 2022/12/01.
//

import XCTest
@testable import InAppPurchaseTest


final class APIServiceTests: XCTestCase {
    
    var sut: APIService!
    

    override func setUpWithError() throws {
        sut = APIService()
    }

    
    override func tearDownWithError() throws {
        sut = nil
    }

    
    func testExample() throws {
        print("testExample start")
        
        sut.number = 100
        
        sut.callRequest { value in
            XCTAssertLessThanOrEqual(value, 45)
            XCTAssertGreaterThanOrEqual(value, 1)
            print("call Request")
        }
        
        print("testExample end")
    }
    
    
    // 비동기 : expectation, fulfill, wait
    /*
     네트워크 TEST : 아이폰 네트워크 응답X, API 서버 점검, API 지연...? >>>
     효율적/속도/같은 조건에서 테스트를 해야 하는데, 그 조건이 깨짐.
     테스트 대상이 외부와 격리되지 않은 상태 -> 예측 불가능한 상황을 만들면 안돼!!
     
     해결 => 실제 네트워크 동작이 되는 것 처럼 보이게 별개의 객체를 만듦!
         => 테스트 더블(Test Double): 테스트 코드랑 상호작용 할 수 있는 가짜 객체(ex. 스턴트맨)
            ex. dummy, mock, fake, stub, spy...
     */
    func test_APILottoResponse_AsyncCover() throws {
        
        let promise = expectation(description: "waiting lotto number, completion handler invoked")
        
        print("testExample start")
        
        sut.number = 100
        
        sut.callRequest { value in
            XCTAssertLessThanOrEqual(value, 45)
            XCTAssertGreaterThanOrEqual(value, 1)
            print("call Request")
            
            promise.fulfill() // expectation으로 정의된 테스트 조건을 충족!
        }
        
        print("testExample end")
        
        wait(for: [promise], timeout: 5)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
