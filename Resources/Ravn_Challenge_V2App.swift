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
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .ravnBlack
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        let backImageIndicator = UIImage.iconBack
        appearance.setBackIndicatorImage(backImageIndicator, transitionMaskImage: backImageIndicator)
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some Scene {
        WindowGroup {
            PeopleListView()
        }
    }
}
