//
//  CollectionViewAsyncTests.swift
//  CollectionViewAsyncTests
//
//  Created by kohei yoshida on 2020/09/25.
//

import XCTest
@testable import CollectionViewAsync

class WebClientTests: XCTestCase,WebClientProtocol{
    
    func callAPI(from url: URL, completion: @escaping (Data) -> Void) {
        let exp = XCTestExpectation(description: "complete Async")
        DispatchQueue.global().async {
            sleep(3)
            XCTAssertNotNil(true)
            exp.fulfill()
            completion(Data())
        }
        wait(for: [exp], timeout: 5)
    }
    
        
    override func setUpWithError() throws {
        super.setUp()
    
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testAPI() throws {
        
        let url = TestData.url
        self.callAPI(from: url) { (data) in
            print("処理終了")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
