//
//  NetworkResponse.swift
//  Ravn-Challenge-V2Tests
//
//  Created by emartinez on 2/25/21.
//

import Foundation

struct NetworkResponse<T> {
    let value: T
    let pageInformation: PageInformation?
}
