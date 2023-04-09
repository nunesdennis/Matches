//
//  OpponentViewModel.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import UIKit

struct OpponentViewModel {
    let imagePlaceHolder: UIImage
    let imageUrl: String?
    let id: Int
    var name: String
    
    func getImage(to imageView: UIImageView) {
        ImageFetcher.shared.fetchImage(fromPhotoURL: imageUrl,
                                       id: id,
                                       to: imageView)
    }
}
