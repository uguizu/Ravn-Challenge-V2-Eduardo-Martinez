//
//  PeopleNetworkService.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/24/21.
//

import Foundation
import Apollo
import Combine

protocol PeopleNetworkServiceType {
    func fetchPeopleList(after: String) -> AnyPublisher<AllPeopleQuery.Data.AllPerson?, Error>
}

struct PeopleNetworkService: PeopleNetworkServiceType {
    
    private let apolloClient = Network.shared.apollo
    
    func fetchPeopleList(after: String) -> AnyPublisher<AllPeopleQuery.Data.AllPerson?, Error> {
        Future { promise in
            apolloClient.fetch(query: AllPeopleQuery(after: after)) { result in
                switch result {
                case .success(let value):
                    promise(.success(value.data?.allPeople))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
