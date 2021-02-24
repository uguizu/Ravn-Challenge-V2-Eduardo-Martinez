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
                
                PeopleDetailCell(title: "Eye Color", value: "Brown")
                    .frame(height: 49)
                PeopleDetailCell(title: "Hair Color", value: "Brown")
                    .frame(height: 49)
                PeopleDetailCell(title: "Skin Color", value: "Brown")
                    .frame(height: 49)
                PeopleDetailCell(title: "Birth Year", value: "19BBY")
                    .frame(height: 49)
                
                PeopleDetailHeader(title: "Vehicles")
                PeopleDetailCell(title: "Snowspeeder", value: "")
                    .frame(height: 49)
                PeopleDetailCell(title: "Imperial Speeder Bike", value: "")
                    .frame(height: 49)
                
            }
        }
    }
}

struct PeopleDetailHeader: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.textDark)
            .padding(.top, 32)
            .padding(.bottom, 8)
            .padding(.horizontal, 16)
    }
}

struct PeopleDetailCell: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.textLight)
                
                Spacer()
                
                Text(value)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.textDark)
            }
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
