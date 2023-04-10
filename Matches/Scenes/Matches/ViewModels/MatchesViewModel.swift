//
//  MatchesViewModel.swift
//  Matches
//
//  Created by Dennis Nunes on 05/04/23.
//

import UIKit

protocol MatchesViewModelProtocol {
    var navigationTitle: String { get }
    func loadMatches(_ completion: @escaping (Result<[CardViewModel], MatchesError>) -> Void)
    func openDetails(of match: MatchModel)
}

final class MatchesViewModel {
    // MARK: - Constants
    
    private var errorAlertTitle: String { Localized("General.Alert.title") }
    private var okButtonTitle: String { Localized("General.Alert.Button.title") }
    
    var navigationTitle: String { Localized("Matches.Navigation.title") }
    
    // MARK: - Private Properties
    
    private var matches: [MatchModel] = []
    private var sortBy: String?
    private var pageNumber: Int = 1
    private var perPage: Int = 50
    private var params: MatchListParams {
        MatchListParams(sort: sortBy, page: pageNumber, perPage: perPage)
    }
    
    // MARK: - Properties
    
    let coordinator: MatchesCoordinatorProtocol
    let service: MatchesServiceProtocol
    
    // MARK: - Initialization
    
    init(service: MatchesServiceProtocol,
         coordinator: MatchesCoordinatorProtocol) {
        self.service = service
        self.coordinator = coordinator
    }
    
    private func Localized(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
    private func createCellViewModels(models: [MatchModel]) -> [CardViewModel] {
        matches.append(contentsOf: models)
        return models.compactMap { model in
            CardViewModel(matchModel: model)
        }
    }
}

extension MatchesViewModel: MatchesViewModelProtocol {
    // MARK: - Public Methods
    
    func loadMatches(_ completion: @escaping (Result<[CardViewModel], MatchesError>) -> Void) {
        service.fetchMatchList(params: params) {[unowned self] result in
            switch result {
            case .success(let matches):
                pageNumber += 1
                let cellViewModels = createCellViewModels(models: matches)
                completion(.success(cellViewModels))
            case .failure(let error):
                print(error)
                let matchesError = MatchesError(title: errorAlertTitle, description: error.localizedDescription, buttonName: okButtonTitle)
                completion(.failure(matchesError))
            }
        }
    }
    
    func openDetails(of match: MatchModel) {
        coordinator.goToMatchDetails(match)
    }
}
