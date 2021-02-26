//
//  People.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/24/21.
//

import Foundation

struct People: Identifiable {
    let wrappedValue: AllPeopleQuery.Data.AllPerson.Person
    
    var id: String {
        wrappedValue.id
    }
    
    var name: String {
        wrappedValue.name ?? ""
    }
    
    var homeworld: String {
        wrappedValue.homeworld?.name ?? ""
    }
    
    var eyeColor: String {
        wrappedValue.eyeColor ?? ""
    }
    
    var hairColor: String {
        wrappedValue.hairColor ?? ""
    }
    
    var skinColor: String {
        wrappedValue.skinColor ?? ""
    }
    
    var birthYear: String {
        wrappedValue.birthYear ?? ""
    }
    
    var vehicles: [Vehicle] {
        wrappedValue.vehicleConnection?.vehicles?
            .compactMap { $0 }
            .map { Vehicle(wrappedValue: $0) } ?? []       
    }
}
