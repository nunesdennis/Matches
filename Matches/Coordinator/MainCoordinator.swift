//
//  MainCoordinator.swift
//  Matches
//
//  Created by Dennis Nunes on 05/04/23.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    var parentCoordinator: CoordinatorProtocol?
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    
    // MARK: - Initialization
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToMainViewController()
    }
    
    // MARK: - Main Scene
    
    private func goToMainViewController() {
        let viewController = MatchesFactory.make(delegate: self)
        navigationController.setViewControllers([viewController], animated: true)
    }
}

extension MainCoordinator: MatchesCoordinatorDelegate {}
