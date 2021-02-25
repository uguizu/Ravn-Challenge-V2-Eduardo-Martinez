//
//  Ravn_Challenge_V2App.swift
//  Shared
//
//  Created by emartinez on 2/23/21.
//

import SwiftUI

@main
struct Ravn_Challenge_V2App: App {
    
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .ravnBlack
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            PeopleListView()
        }
    }
}
