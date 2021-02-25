//
//  PeopleListView.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/23/21.
//

import SwiftUI

struct PeopleListView: View {
    
    @StateObject var viewModel = PeopleListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.peopleList) { people in
                        PeopleCell(name: people.name, homeworld: people.homeworld)
                            .frame(height: 69)
                            .transition(.move(edge: .top))
                            .onTapGesture {
                                
                            }
                    }
                    
                    if viewModel.hasNextPage && !viewModel.error {
                        LoadingView()
                            .padding(.top, 16)
                            .onAppear {
                                if viewModel.hasNextPage {
                                    viewModel.requestNextPage.send(())
                                }
                            }
                    }
                    
                    if viewModel.error {
                        HeaderTextView(type: .highEmphasis, value: "Failed to Load Data")
                            .padding(.top, 16)
                    }
                }
                .animation(.default)
                
            }
            .navigationTitle("People of Star Wars")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PeopleCell: View {
    
    let name: String
    let homeworld: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading ,spacing: 0) {
                    HeaderTextView(type: .regular, value: name)
                    ParagraphTextView(type: .lowEmphasis, value: homeworld)
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
