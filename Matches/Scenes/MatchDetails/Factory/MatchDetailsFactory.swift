//
//  MatchDetailsFactory.swift
//  Matches
//
//  Created by Dennis Nunes on 10/04/23.
//

import Foundation

struct MatchesDetailsFactory {
    static func make(match: MatchModel, coordinator: MatchesCoordinatorProtocol) -> MatchesViewControllerProtocol {
        let viewModel = MatchDetailsViewModel(match: match, coordinator: coordinator)
        let controller = MatchDetailsViewController(viewModel: viewModel)

        return controller
    }
}
