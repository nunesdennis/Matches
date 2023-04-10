//
//  MatchDetailsViewModel.swift
//  Matches
//
//  Created by Dennis Nunes on 10/04/23.
//

import UIKit

protocol MatchDetailsViewModelProtocol {
    var navigationTitle: String { get }
    var opponentVersusViewModel: OpponentVersusViewModel? { get }
}

final class MatchDetailsViewModel {
    // MARK: - Constants
    
    static let imagePlaceHolderName = "teamPlaceHolder"
    
    // MARK: - Private Properties
    
    private let placeHolder = UIImage(named: imagePlaceHolderName) ?? UIImage()
    private let match: MatchModel
    
    // MARK: - Properties
    
    let coordinator: MatchesCoordinatorProtocol
    var opponentVersusViewModel: OpponentVersusViewModel?
    var navigationTitle: String {
        let serieName = match.serie.name ?? match.serie.fullName
        
        return match.league.name + " " + serieName
    }
    
    // MARK: - Initialization
    
    init(match: MatchModel,
         coordinator: MatchesCoordinatorProtocol) {
        self.match = match
        self.coordinator = coordinator
        createOpponentVersusViewModel(matchModel: match)
    }
    
    private func createOpponentVersusViewModel(matchModel: MatchModel) {
        guard let leftOpponent = matchModel.opponents.first?.opponent,
              let rightOpponent = matchModel.opponents.last?.opponent else {
            return
        }
        let leftOpponentViewModel = createOpponent(leftOpponent)
        let rightOpponentViewModel = createOpponent(rightOpponent)
        
        opponentVersusViewModel = OpponentVersusViewModel(leftOpponent: leftOpponentViewModel,
                                                          rightOpponent: rightOpponentViewModel)
    }
    
    private func createOpponent(_ opponent: OpponentInfoModel) -> OpponentViewModel {
        return .init(imagePlaceHolder: placeHolder,
                     imageUrl: opponent.imageUrl,
                     id: opponent.id,
                     name: opponent.name)
    }
}

extension MatchDetailsViewModel: MatchDetailsViewModelProtocol {}
