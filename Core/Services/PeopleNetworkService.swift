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
    
    let networkClient: NetworkClientType
    
    init(networkClient: NetworkClientType = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetchPeopleList(after: String) -> AnyPublisher<AllPeopleQuery.Data.AllPerson?, Error> {
        networkClient.fetch(query: AllPeopleQuery(after: after))
            .map { $0?.allPeople }
            .eraseToAnyPublisher()
    }
}
