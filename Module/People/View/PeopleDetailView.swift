//
//  PeopleDetailView.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/23/21.
//

import SwiftUI

struct PeopleDetailView: View {
    
    let people: People
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                PeopleDetailHeader(title: Translations.peopleDetailGeneralInformationHeaderText)
                
                PeopleDetailCell(label: Translations.peopleDetailGeneralInformationEyeColorText, value: people.eyeColor)
                PeopleDetailCell(label: Translations.peopleDetailGeneralInformationHairColorText, value: people.hairColor)
                PeopleDetailCell(label: Translations.peopleDetailGeneralInformationSkinColorText, value: people.skinColor)
                PeopleDetailCell(label: Translations.peopleDetailGeneralInformationBirthYearText, value: people.birthYear)
                
                if !people.vehicles.isEmpty {
                    PeopleDetailHeader(title: Translations.peopleDetailVehicleHeaderText)
                    
                    ForEach(people.vehicles) {
                        PeopleVehicleCell(value: $0.name)
                    }
                }
            }
        }
        .navigationTitle(people.name)
    }
}

struct PeopleDetailHeader: View {
    let title: String
    
    var body: some View {
        HeaderTextView(type: .regular, value: title)
            .padding(.top, 32)
            .padding(.bottom, 8)
            .padding(.horizontal, 16)
    }
}

struct PeopleDetailCell: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack {
            HStack {
                HeaderTextView(type: .lowEmphasis, value: label)
                
                Spacer(minLength: 16)
                
                HeaderTextView(type: .regular, value: value)
            }
            .padding(.top, 14)
            .padding(.bottom, 15)
            .padding(.horizontal, 16)
            
            Divider()
                .padding(.leading, 16)
        }
        .frame(height: 49)
    }
}

struct PeopleVehicleCell: View {
    let value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderTextView(type: .lowEmphasis, value: value)
                .padding(.top, 14)
                .padding(.bottom, 15)
                .padding(.horizontal, 16)
            
            Divider()
                .padding(.leading, 16)
        }
        .frame(height: 49)
    }
}

struct PeopleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDetailView(people: .init(wrappedValue: .init(id: "")))
    }
}
