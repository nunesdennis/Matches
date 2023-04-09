//
//  ImageFetcher.swift
//  Matches
//
//  Created by Dennis Nunes on 09/04/23.
//

import UIKit

class ImageFetcher {
    
    private let imagePlaceHolderName = "teamPlaceHolder"
    private let imageCache: ImageCacheProtocol = ImageCache()
    
    static var shared: ImageFetcher = {
        let instance = ImageFetcher()
        return instance
    }()

    private init() {}
    
    func fetchImage(fromPhotoURL url: String?, id: Int, to imageView: UIImageView) {
        var newImage = UIImage(named: imagePlaceHolderName) ?? UIImage()
        
        guard let url = url,
              let urlPhoto = URL(string: url),
              let urlKey = URL(string: url + String(id)) else {
            return
        }

        if imageCache[urlKey] == nil {
            DispatchQueue.global().async { [unowned self] in
                if let data = try? Data(contentsOf: urlPhoto),
                   let imageReceived = UIImage(data: data) {
                    newImage = imageReceived
                    imageCache[urlKey] = newImage
                    DispatchQueue.main.async {
                        imageView.image = newImage
                    }
                }
            }
        }
        
        newImage = imageCache[urlKey] ?? newImage
        imageView.image = newImage
        return
    }
}
