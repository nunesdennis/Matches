//
//  MatchesFactory.swift
//  Matches
//
//  Created by Dennis Nunes on 05/04/23.
//

import Foundation

struct MatchesFactory {
    static func make(delegate: MatchesCoordinatorDelegate) -> MatchesViewControllerProtocol {
        let coordinator = MatchesCoordinator()
        let service = MatchesService()
        let viewModel = MatchesViewModel(service: service, coordinator: coordinator)
        let controller = MatchesViewController(viewModel: viewModel)

        return controller
    }
}
