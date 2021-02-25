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
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://swapi-graphql.netlify.app/.netlify/functions/index")!)
}

struct NetworkClient {
    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:8080/graphql")!)
    
//    func fetch(query: GraphQLOperation) -> AnyPublisher<Any, Error> {
//        Future { promise in
//            
//        }
//    }
}
