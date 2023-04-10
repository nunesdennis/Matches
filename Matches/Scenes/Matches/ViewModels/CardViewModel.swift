//
//  MatchCellViewModel.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import UIKit

class CardViewModel {
    // MARK: - Constants
    
    static let imagePlaceHolderName = "teamPlaceHolder"
    
    // MARK: - Static Properties
    
    static let placeHolder = UIImage(named: imagePlaceHolderName) ?? UIImage()
    
    // MARK: - Private Properties
    
    private let matchModel: MatchModel
    
    // MARK: - Properties
    
    let opponentVersusViewModel: OpponentVersusViewModel
    let leagueSerieViewModel: LeagueSerieViewModel
    let matchTimeViewModel: MatchTimeViewModel
    
    // MARK: - Initialization
    
    init?(matchModel: MatchModel) {
        self.matchModel = matchModel
        guard let versusViewModel = CardViewModel.createOpponentVersusViewModel(matchModel: matchModel),
              let leagueViewModel = CardViewModel.createLeagueSerieViewModel(matchModel: matchModel) else {
            return nil
        }
        opponentVersusViewModel = versusViewModel
        leagueSerieViewModel = leagueViewModel
        matchTimeViewModel = MatchTimeViewModel(beginAt: matchModel.beginAt, endAt: matchModel.endAt)
    }
    
    // MARK: - Private Methods
    
    private static func createLeagueSerieViewModel(matchModel: MatchModel) -> LeagueSerieViewModel? {
        return .init(imagePlaceHolder: placeHolder,
                     imageUrl: matchModel.league.imageUrl,
                     id: matchModel.league.id,
                     title: matchModel.league.name)
    }
    
    private static func createOpponentVersusViewModel(matchModel: MatchModel) -> OpponentVersusViewModel? {
        guard let leftOpponent = matchModel.opponents.first?.opponent,
              let rightOpponent = matchModel.opponents.last?.opponent else {
            return nil
        }
        let leftOpponentViewModel = createOpponent(leftOpponent)
        let rightOpponentViewModel = createOpponent(rightOpponent)
        
        return OpponentVersusViewModel(leftOpponent: leftOpponentViewModel,
                                       rightOpponent: rightOpponentViewModel)
    }
    
    private static func createOpponent(_ opponent: OpponentInfoModel) -> OpponentViewModel {
        return .init(imagePlaceHolder: placeHolder,
                     imageUrl: opponent.imageUrl,
                     id: opponent.id,
                     name: opponent.name)
    }
    
    // MARK: - Public Methods
    
    func getMatchDetails() -> MatchModel {
        return matchModel
    }
}
