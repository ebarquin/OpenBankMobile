//
//  RootCoordinator.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 15/9/21.
//

import UIKit

final class RootCoordinator: Coordinator {
    private unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewController = setupViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func setupViewController() -> UIViewController {
        let viewController = RootViewController.initFromStoryboard()
        let apiClient = APIClientDefault()
        let superHeroRepository = SuperHeroesRepositoryDefault(apiClient: apiClient)
        viewController.viewModel = RootViewModel(superHeroesRepository: superHeroRepository)
    
        return viewController
    }
}
