//
//  MatchModel.swift
//  Matches
//
//  Created by Dennis Nunes on 05/04/23.
//

import Foundation

struct MatchModel: Decodable {
    let beginAt: String
    let detailedStats: Bool
    let draw: Bool
    let endAt: String?
    let forfeit: Bool
    let gameAdvantage: Int?
    let games: [GameModel]
    let id: Int
    let league: LeagueModel
    let leagueId: Int
    let live: LiveModel
    let matchType: String
    let modifiedAt: String
    let name: String
    let numberOfGames: Int
    let opponents: [OpponentModel]
    let originalScheduledAt: String
    let rescheduled: Bool
    let results: [ResultModel]
    let scheduledAt: String
    let serie: SerieModel
    let serieId: Int
    let slug: String
    let status: String
    let streamsList: [StreamListModel]
    let tournament: TournamentModel
    let videogameVersion: VideogameVersionModel
    let winner: WinnerModel?
    let winnerId: Int?
    let winnerType: String
}

//TODO: // Check if these will be needed
struct WinnerModel: Decodable {}
struct VideogameVersionModel: Decodable {}
struct VideogameModel: Decodable {}
struct TournamentModel: Decodable {}
struct StreamListModel: Decodable {}
struct SerieModel: Decodable {}
struct ResultModel: Decodable {}
struct LiveModel: Decodable {}
struct GameModel: Decodable {}
