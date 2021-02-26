//
//  NavigationViewController+Extensions.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/25/21.
//

import SwiftUI

extension UINavigationController: UINavigationControllerDelegate {
    // MARK: Lifecycle
    open override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
        delegate = self
    }
    
    // MARK: Privaye methods
    private func applyStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .ravnBlack
        appearance.titleTextAttributes = [.foregroundColor: UIColor.adaptativeWhite ?? .white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.adaptativeWhite ?? .white]
        let backImageIndicator = UIImage.iconBack
        appearance.setBackIndicatorImage(backImageIndicator, transitionMaskImage: backImageIndicator)
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .adaptativeWhite
    }
    
    // MARK: UINavigationControllerDelegate methods
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let item = UIBarButtonItem(title: "  ", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
    }
}
