//
//  Vehicle.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/24/21.
//

import Foundation

struct Vehicle: Identifiable {
    let wrappedValue: AllPeopleQuery.Data.AllPerson.Person.VehicleConnection.Vehicle
    
    var id: String {
        wrappedValue.id
    }
    
    var name: String {
        wrappedValue.name ?? ""
    }
}
