//
//  DetailCoordinator.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 20/9/21.
//

import UIKit

final class DetailCoordinator: Coordinator {
    private unowned let navigationController: UINavigationController
    private let id: Int
    
    init(navigationController: UINavigationController, id: Int) {
        self.navigationController = navigationController
        self.id = id
    }
    
    override func start() {
        let viewController = setupViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func setupViewController() -> UIViewController {
        let viewController = DetailViewController.initFromStoryboard()
        let apiClient = APIClientDefault()
        let superHeroRepository = SuperHeroesRepositoryDefault(apiClient: apiClient)
        let viewModel = DetailViewModel(superHeroesRepository: superHeroRepository, id: id)
        viewController.viewModel = viewModel
        
        return viewController
    }
}
