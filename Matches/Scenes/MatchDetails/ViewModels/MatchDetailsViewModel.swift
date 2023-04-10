//
//  MatchDetailsViewModel.swift
//  Matches
//
//  Created by Dennis Nunes on 10/04/23.
//

import UIKit

protocol MatchDetailsViewModelProtocol {
    var navigationTitle: String { get }
}

final class MatchDetailsViewModel {
    // MARK: - Constants
    
    var navigationTitle: String {
        let serieName = match.serie.name ?? match.serie.fullName
        
        return match.league.name + " " + serieName
    }
    
    // MARK: - Private Properties
    
    private let match: MatchModel
    
    // MARK: - Properties
    
    let coordinator: MatchesCoordinatorProtocol
    
    // MARK: - Initialization
    
    init(match: MatchModel,
         coordinator: MatchesCoordinatorProtocol) {
        self.match = match
        self.coordinator = coordinator
    }
}

extension MatchDetailsViewModel: MatchDetailsViewModelProtocol {}
