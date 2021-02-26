//
//  PageInformation.swift
//  Ravn-Challenge-V2Tests
//
//  Created by emartinez on 2/25/21.
//

import Foundation

struct PageInformation {
    let wrappedValue: AllPeopleQuery.Data.AllPerson.PageInfo
    
    var hasNextPage: Bool {
        wrappedValue.hasNextPage
    }
    
    var cursor: String {
        wrappedValue.endCursor ?? ""
    }
}
