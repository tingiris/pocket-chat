//
//  iosExampleTests.swift
//  iosExampleTests
//
//  Created by jeremy beal on 3/14/19.
//  Copyright © 2019 Pocket_Sample. All rights reserved.
//

import XCTest
import PocketEth

@testable import iosExample

class iosExampleTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testCreatewallet() {
        
        do {
            let wallet = try? PocketEth.createWallet(subnetwork: "4", data: nil)
            
            print(wallet)
        } catch {
            print(error)
        }
       
    }
    

}
