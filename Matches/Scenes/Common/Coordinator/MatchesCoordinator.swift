//
//  MatchesCoordinator.swift
//  Matches
//
//  Created by Dennis Nunes on 05/04/23.
//

import UIKit

protocol MatchesCoordinatorDelegate {}
protocol MatchesCoordinatorProtocol {
    func goToMatches()
    func goToMatchDetails(_ match: MatchModel)
}

final class MatchesCoordinator: CoordinatorProtocol {
    // MARK: - Properties
    weak var parentCoordinator: CoordinatorProtocol?
    var childCoordinators: [CoordinatorProtocol] = []
    weak var navigationController: UINavigationController?
    
    // MARK: - Initialization
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    // MARK: - Methods
    func start() {
        goToMatches()
    }
}

extension MatchesCoordinator: MatchesCoordinatorProtocol {
    func goToMatches() {
        let viewController = MatchesFactory.make(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToMatchDetails(_ match: MatchModel) {
        let viewController = MatchesDetailsFactory.make(match: match, coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
