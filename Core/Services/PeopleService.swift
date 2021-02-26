//
//  PeopleNetworkService.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/24/21.
//

import Foundation
import Apollo
import Combine

protocol PeopleServiceType {
    func fetchPeopleList(after: String) -> AnyPublisher<NetworkResponse<[People]>, Error>
}

struct PeopleService: PeopleServiceType {
    
    let networkClient: NetworkClientType
    
    init(networkClient: NetworkClientType = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetchPeopleList(after: String) -> AnyPublisher<NetworkResponse<[People]>, Error> {
        networkClient.fetch(query: AllPeopleQuery(after: after))
            .compactMap { data in
                if let people = data?.allPeople?.people?.compactMap({ $0 }).map({ People(wrappedValue: $0) }),
                   let pageInformation = data?.allPeople?.pageInfo {
                    return NetworkResponse(value: people, pageInformation: .init(wrappedValue: pageInformation))
                }
                return nil
            }
            .eraseToAnyPublisher()
    }
}
