//
//  PeopleServiceMock.swift
//  Ravn-Challenge-V2Tests
//
//  Created by emartinez on 2/25/21.
//

import Foundation
import Combine
@testable import Ravn_Challenge_V2

struct PeopleServiceMock: PeopleServiceType {
    
    let errorFlag: Bool
    let shouldShowNextPage: Bool
    
    func fetchPeopleList(after: String) -> AnyPublisher<NetworkResponse<[People]>, Error> {
        let customError = NSError(domain: "PeopleServiceMock", code: 5000, userInfo: nil)
        if errorFlag {
            return Fail(error: customError).eraseToAnyPublisher()
        } else {
            
            let people = (0...4).map { People(wrappedValue: .init(id: "\($0)")) }
            
            return Just(NetworkResponse(value: people,
                                        pageInformation: .init(wrappedValue: .init(hasNextPage: shouldShowNextPage))))
                .mapError { _ in customError }
                .eraseToAnyPublisher()
        }
    }
}
