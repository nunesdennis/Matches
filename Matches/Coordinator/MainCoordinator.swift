//
//  MainCoordinator.swift
//  Matches
//
//  Created by Dennis Nunes on 05/04/23.
//

import UIKit

final class MainCoordinator: CoordinatorProtocol {
    // MARK: - Properties
    var parentCoordinator: CoordinatorProtocol?
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController?
    
    // MARK: - Initialization
    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToMainViewController()
    }
    
    // MARK: - Main Scene
    
    private func goToMainViewController() {
        let coordinator = MatchesCoordinator(navigationController: navigationController)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

extension MainCoordinator: MatchesCoordinatorDelegate {}
