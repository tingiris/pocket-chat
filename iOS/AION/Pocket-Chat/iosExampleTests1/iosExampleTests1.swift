//
//  iosExampleTests1.swift
//  iosExampleTests1
//
//  Created by jeremy beal on 3/18/19.
//  Copyright © 2019 Pocket_Sample. All rights reserved.
//

import XCTest
import PocketSwift

class iosExampleTests1: XCTestCase {

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
    
    func testWallet(){
        
        let pocketAion = try? PocketAion.init(devID: "DEV111", netIds: ["32","356"], defaultNetID: "32", maxNodes: 5, requestTimeOut: 20000)
    
        do {
         
            let wallet = try?pocketAion!.mastery!.createWallet()
            print(wallet?.address)
        } catch {
            print(error)
        }
       
        
       
        
        
    }

}
