//
//  OpponentInfoModel.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import Foundation

struct OpponentInfoModel: Decodable {
    let acronym: String?
    let id: Int
    let imageUrl: String?
    let location: String?
    let modifiedAt: String
    let name: String
    let slug: String
}
