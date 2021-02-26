//
//  NetworkConfiguration.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/25/21.
//

import Foundation

enum NetworkConfiguration {
    static var baseURL: URL {
        guard let url = URL(string: "https://swapi-graphql.netlify.app/.netlify/functions/index") else {
            fatalError("URL could not be configured correctly.")
        }
        return url
    }
}
