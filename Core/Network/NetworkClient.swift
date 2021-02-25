//
//  Network.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/24/21.
//

import Combine
import Foundation
import Apollo

class Network {
    static let shared = Network()
    private(set) lazy var apolloClient = ApolloClient(url: URL(string: "https://swapi-graphql.netlify.app/.netlify/functions/index")!)
}

protocol NetworkClientType {
    func fetch<Query: GraphQLQuery>(query: Query) -> AnyPublisher<Query.Data?, Error>
}

struct NetworkClient: NetworkClientType {
    let apolloClient: ApolloClient
    
    init(apolloClient: ApolloClient = Network.shared.apolloClient) {
        self.apolloClient = apolloClient
    }
    
    func fetch<Query: GraphQLQuery>(query: Query) -> AnyPublisher<Query.Data?, Error> {
        Future { promise in
            apolloClient.fetch(query: query) { result in
                switch result {
                case .success(let value):
                    promise(.success(value.data))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    
}
