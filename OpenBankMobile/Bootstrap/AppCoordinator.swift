//
//  AppCoordinator.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 15/9/21.
//

import UIKit

final class AppCoordinator: Coordinator {
    private let window: UIWindow
    private let navigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        customizeAppearance()
        window.rootViewController = navigationController
        let coordinator = RootCoordinator(navigationController: navigationController)
        coordinator.start()
        add(child: coordinator)
        
        window.makeKeyAndVisible()
    }
}
