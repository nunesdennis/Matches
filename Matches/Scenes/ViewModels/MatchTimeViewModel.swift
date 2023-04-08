//
//  MatchTimeViewModel.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import UIKit

struct MatchTimeViewModel {
    let dateString: String
    
    func formattedTime() -> String {
        dateString
    }
    func backgroundColor() -> UIColor {
        .yellow
    }
    func titleColor() -> UIColor {
        .blue
    }
}
