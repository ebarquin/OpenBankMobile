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
        viewController.navigateToDetail = navigateToDetail
        let apiClient = APIClientDefault()
        let superHeroRepository = SuperHeroesRepositoryDefault(apiClient: apiClient)
        viewController.viewModel = RootViewModel(superHeroesRepository: superHeroRepository)
    
        return viewController
    }
    
    private func navigateToDetail(id: Int) {
        let coordinator = DetailCoordinator(navigationController: navigationController, id: id)
        add(child: coordinator)
        coordinator.start()
    }
}
