//
//  MatchCellViewModel.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import UIKit

class CardViewModel {
    // MARK: - Constant
    
    static let imagePlaceHolderName = "teamPlaceHolder"
    
    // MARK: - Public Properties
    
    let opponentVersusViewModel: OpponentVersusViewModel
    let leagueSerieViewModel: LeagueSerieViewModel
    let matchTimeViewModel: MatchTimeViewModel
    
    init?(matchModel: MatchModel, imageCache: ImageCacheProtocol) {
        guard let versusViewModel = CardViewModel.createOpponentVersusViewModel(matchModel: matchModel, imageCache: imageCache),
              let leagueViewModel = CardViewModel.createLeagueSerieViewModel(matchModel: matchModel, imageCache: imageCache) else {
            return nil
        }
        
        opponentVersusViewModel = versusViewModel
        leagueSerieViewModel = leagueViewModel
        matchTimeViewModel = MatchTimeViewModel(dateString: matchModel.beginAt)
    }
    
    private static func createLeagueSerieViewModel(matchModel: MatchModel, imageCache: ImageCacheProtocol) -> LeagueSerieViewModel? {
        let leagueImage = CardViewModel.loadPhotoData(fromPhotoURL: matchModel.league.imageUrl, id: matchModel.league.id, using: imageCache)
        
        return LeagueSerieViewModel(image: leagueImage,
                                    title: matchModel.league.name)
    }
    
    private static func createOpponentVersusViewModel(matchModel: MatchModel, imageCache: ImageCacheProtocol) -> OpponentVersusViewModel? {
        guard let leftOpponent = matchModel.opponents.first?.opponent,
              let rightOpponent = matchModel.opponents.last?.opponent else {
            return nil
        }
        let leftOpponentViewModel = createOpponent(leftOpponent, imageCache: imageCache)
        let rightOpponentViewModel = createOpponent(rightOpponent, imageCache: imageCache)
        
        return OpponentVersusViewModel(leftOpponent: leftOpponentViewModel,
                                       rightOpponent: rightOpponentViewModel)
    }
    
    private static func createOpponent(_ opponent: OpponentInfoModel, imageCache: ImageCacheProtocol) -> OpponentViewModel {
        let leftOpponentImage = loadPhotoData(fromPhotoURL: opponent.imageUrl, id: opponent.id, using: imageCache)
        
        return OpponentViewModel(image: leftOpponentImage,
                                 name: opponent.name)
    }
    
    private static func loadPhotoData(fromPhotoURL url: String?, id: Int, using imageCache: ImageCacheProtocol) -> UIImage {
        let placeHolder = UIImage(named: imagePlaceHolderName) ?? UIImage()
        guard let url = url,
              let urlPhoto = URL(string: url),
              let urlKey = URL(string: url + String(id)) else { return placeHolder }
        
        if imageCache[urlKey] == nil {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: urlPhoto) {
                    imageCache[urlKey] = UIImage(data: data)
                }
            }
            return placeHolder
        }

        return imageCache[urlKey] ?? placeHolder
    }
}
