//
//  PeopleServiceTest.swift
//  Ravn-Challenge-V2Tests
//
//  Created by emartinez on 2/25/21.
//

import XCTest
import Combine
@testable import Ravn_Challenge_V2

class PeopleServiceTest: XCTestCase {

    var service: PeopleService?
    var cancellables = Set<AnyCancellable>()

    override func tearDownWithError() throws {
        cancellables = []
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
