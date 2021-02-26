//
//  NavigationViewController+Extensions.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/25/21.
//

import SwiftUI

extension UINavigationController: UINavigationControllerDelegate {
    // MARK: Variables Declaration
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        traitCollection.userInterfaceStyle == .dark ? .darkContent : .lightContent
    }
    
    // MARK: Lifecycle
    open override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    // MARK: UINavigationControllerDelegate methods
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let item = UIBarButtonItem(title: "  ", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
    }
}
