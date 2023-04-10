//
//  MatchesCoordinator.swift
//  Matches
//
//  Created by Dennis Nunes on 05/04/23.
//

import UIKit

protocol MatchesCoordinatorDelegate {}
protocol MatchesCoordinatorProtocol {
    func goToMatchDetails(_ match: MatchModel)
}

final class MatchesCoordinator: CoordinatorProtocol {
    var parentCoordinator: CoordinatorProtocol?
    var childCoordinators: [CoordinatorProtocol] = []
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MatchesFactory.make(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MatchesCoordinator: MatchesCoordinatorProtocol {
    func goToMatchDetails(_ match: MatchModel) {
        let viewController = UIViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
