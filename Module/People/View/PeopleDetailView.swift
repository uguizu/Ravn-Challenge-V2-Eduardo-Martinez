//
//  PeopleDetailView.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/23/21.
//

import SwiftUI

struct PeopleDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                PeopleDetailHeader(title: "General Information")
                
                PeopleDetailCell(label: "Eye Color", value: "Brown")
                    .frame(height: 49)
                PeopleDetailCell(label: "Hair Color", value: "Brown")
                    .frame(height: 49)
                PeopleDetailCell(label: "Skin Color", value: "Brown")
                    .frame(height: 49)
                PeopleDetailCell(label: "Birth Year", value: "19BBY")
                    .frame(height: 49)
                
                PeopleDetailHeader(title: "Vehicles")
                
                PeopleVehicleCell(value: "Snowspeeder")
                    .frame(height: 49)
                PeopleVehicleCell(value: "Snowspeeder")
                    .frame(height: 49)
                
            }
        }
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
    }
}

struct PeopleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDetailView()
    }
}
