//
//  MatchesError.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import Foundation

struct MatchesError: Error {
    let title: String
    let description: String
    let buttonName: String
}
