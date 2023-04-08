//
//  MatchesViewModel.swift
//  Matches
//
//  Created by Dennis Nunes on 05/04/23.
//

import UIKit

protocol MatchesViewModelProtocol {
    var imageCache: ImageCacheProtocol { get }
    var navigationTitle: String { get }
    func loadMatches(_ completion: @escaping (Result<[CardViewModel], MatchesError>) -> Void)
}

final class MatchesViewModel {
    // MARK: - Constants
    
    var errorAlertTitle: String { Localized("General.Alert.title") }
    var okButtonTitle: String { Localized("General.Alert.Button.title") }
    var navigationTitle: String { Localized("Matches.Navigation.title") }
    
    // MARK: - Private Properties
    
    private var sortBy: String?
    private var pageNumber: Int?
    private var perPage: Int?
    private var params: MatchListParams {
        MatchListParams(sort: sortBy, page: pageNumber, perPage: perPage)
    }
    
    // MARK: - Properties
    
    let imageCache: ImageCacheProtocol
    let coordinator: MatchesCoordinatorProtocol
    let service: MatchesServiceProtocol
    
    // MARK: - Initialization
    
    init(service: MatchesServiceProtocol,
         coordinator: MatchesCoordinatorProtocol,
         imageCache: ImageCacheProtocol = ImageCache()) {
        self.service = service
        self.coordinator = coordinator
        self.imageCache = imageCache
    }
    
    private func Localized(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
    private func createCellViewModels(models: [MatchModel]) -> [CardViewModel] {
        return models.compactMap { model in
            CardViewModel(matchModel: model, imageCache: imageCache)
        }
    }
}

extension MatchesViewModel: MatchesViewModelProtocol {
    // MARK: - Public Methods
    
    func loadMatches(_ completion: @escaping (Result<[CardViewModel], MatchesError>) -> Void) {
        service.fetchMatchList(params: params) {[unowned self] result in
            switch result {
            case .success(let matches):
                let cellViewModels = createCellViewModels(models: matches)
                completion(.success(cellViewModels))
            case .failure(let error):
                print(error)
                let matchesError = MatchesError(title: errorAlertTitle, description: error.localizedDescription, buttonName: okButtonTitle)
                completion(.failure(matchesError))
            }
        }
    }
}
