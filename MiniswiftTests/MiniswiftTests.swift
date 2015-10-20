//
//  MiniswiftTests.swift
//  MiniswiftTests
//
//  Created by Evan Miller on 10/14/15.
//  Copyright © 2015 Evan Miller. All rights reserved.
//

import XCTest
@testable import Miniswift

class MiniswiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        let name = Flag(flags: ["--name", "-n"], expects: FlagValue.String, description: "Your name.")
        self.measureBlock {
            // Put the code you want to measure the time of here.
            assert(Miniswift([name], argv:["--name", "evan", "hello"]).args.strings[name] == "evan"
)        }
    }
    
}
