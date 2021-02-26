//
//  PeopleListViewModelTest.swift
//  Ravn-Challenge-V2Tests
//
//  Created by emartinez on 2/25/21.
//

import XCTest
import Combine
@testable import Ravn_Challenge_V2

class PeopleListViewModelTest: XCTestCase {
    
    var viewModel: PeopleListViewModel?
    var cancellables: Set<AnyCancellable>?
    
    override func setUpWithError() throws {
        viewModel = .init()
        cancellables = []
    }

    override func tearDownWithError() throws {
        viewModel = nil
        cancellables = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
