//
//  PeopleListView.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/23/21.
//

import SwiftUI

struct PeopleListView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(0...10, id: \.self) { _ in
                        PeopleCell()
                            .frame(height: 69)
                    }
                }
            }
            .navigationTitle("People of Star Wars")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PeopleCell: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading ,spacing: 0) {
                    Text("Luke Skywalker")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.textDark)
                    
                    Text("Human from Tatooine")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.textLight)
                }
                .padding(.leading, 16)
                
                Spacer()
                
                Image.iconRight
                    .resizable()
                    .frame(width: 8, height: 12)
                    .padding(.trailing, 24)
            }
            .padding(.top, 16)
            
            Spacer()
            
            Divider()
                .padding(.leading, 16)
        }
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView()
    }
}
