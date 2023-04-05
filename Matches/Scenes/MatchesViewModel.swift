//
//  MatchesViewModel.swift
//  Matches
//
//  Created by Dennis Nunes on 05/04/23.
//

import Foundation

protocol MatchesViewModelProtocol {
    func serviceTest()
}

final class MatchesViewModel {
    // MARK: - Properties
    let coordinator: MatchesCoordinatorProtocol
    let service: MatchesServiceProtocol
    
    // MARK: - Initialization
    init(service: MatchesServiceProtocol, coordinator: MatchesCoordinatorProtocol) {
        self.service = service
        self.coordinator = coordinator
    }
    
    // MARK: - Public Methods
    func serviceTest() {
        let params = MatchListParams(sort: nil, page: 1, perPage: 2)
        service.fetchMatchList(params: params) { result in
            switch result {
            case .success:
                //TODO: // Needs to be done
                break
            case .failure:
                //TODO: // Needs to be done
                break
            }
        }
    }
}

extension MatchesViewModel: MatchesViewModelProtocol {}
