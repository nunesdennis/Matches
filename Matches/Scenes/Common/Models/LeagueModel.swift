//
//  LeagueModel.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import Foundation

struct LeagueModel: Decodable {
    let id: Int
    let imageUrl: String?
    let modifiedAt: String
    let name: String
    let slug: String
    let url: String?
}
