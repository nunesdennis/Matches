//
//  LeagueSerieViewModel.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import UIKit

struct LeagueSerieViewModel {
    let imagePlaceHolder: UIImage
    let imageUrl: String?
    let id: Int
    let title: String
    
    func getImage(to imageView: UIImageView) {
        ImageFetcher.shared.fetchImage(fromPhotoURL: imageUrl,
                                       id: id,
                                       to: imageView)
    }
}
