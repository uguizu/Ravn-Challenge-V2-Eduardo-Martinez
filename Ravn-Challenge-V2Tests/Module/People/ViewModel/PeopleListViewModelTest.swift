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

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testRequestDataSuccess() throws {
        // Given
        viewModel = .init(service: PeopleServiceMock(errorFlag: false, shouldShowNextPage: false))
        
        // When
        viewModel?.requestNextPage.send(())
        _ = XCTWaiter.wait(for: [XCTestExpectation()], timeout: 1.2)
        
        // Then
        XCTAssertEqual(viewModel?.peopleList.count, 5)
        XCTAssertFalse(viewModel?.error ?? true)
    }
    
    func testRequestDataError() throws {
        // Given
        viewModel = .init(service: PeopleServiceMock(errorFlag: true, shouldShowNextPage: false))
        
        // When
        viewModel?.requestNextPage.send(())
        _ = XCTWaiter.wait(for: [XCTestExpectation()], timeout: 1.2)
        
        // Then
        XCTAssertTrue(viewModel?.error ?? true)
    }
    
    func testRequestPagination() throws {
        // Given
        viewModel = .init(service: PeopleServiceMock(errorFlag: false, shouldShowNextPage: true))
        
        // When
        viewModel?.requestNextPage.send(())
        _ = XCTWaiter.wait(for: [XCTestExpectation()], timeout: 2)
        viewModel?.requestNextPage.send(())
        _ = XCTWaiter.wait(for: [XCTestExpectation()], timeout: 2)
        viewModel?.requestNextPage.send(())
        _ = XCTWaiter.wait(for: [XCTestExpectation()], timeout: 2)
        
        
        // Then
        XCTAssertEqual(viewModel?.peopleList.count, 15)
        XCTAssertFalse(viewModel?.error ?? true)
    }
    
    func testRequestNoNextPage() throws {
        // Given
        viewModel = .init(service: PeopleServiceMock(errorFlag: false, shouldShowNextPage: false))
        
        // When
        viewModel?.requestNextPage.send(())
        _ = XCTWaiter.wait(for: [XCTestExpectation()], timeout: 2)
        viewModel?.requestNextPage.send(())
        _ = XCTWaiter.wait(for: [XCTestExpectation()], timeout: 2)
        viewModel?.requestNextPage.send(())
        _ = XCTWaiter.wait(for: [XCTestExpectation()], timeout: 2)
        
        // Then
        XCTAssertEqual(viewModel?.peopleList.count, 5)
        XCTAssertFalse(viewModel?.error ?? true)
    }
}
