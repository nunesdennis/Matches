//
//  MatchesService.swift
//  Matches
//
//  Created by Dennis Nunes on 05/04/23.
//

import Foundation

protocol MatchesServiceProtocol {
    func fetchMatchList(params: MatchListParams,completion: @escaping (Result<[MatchModel], Error>) -> Void)
}

final class MatchesService: MatchesServiceProtocol {
    // MARK: - Properties
    var apiClient: APIClientProtocol
    
    // MARK: - Initialization
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    // MARK: - Public Methods
    func fetchMatchList(params: MatchListParams, completion: @escaping (Result<[MatchModel], Error>) -> Void) {
        let endpoint = MatchesEndpoint(params)
        
        apiClient.request(endpoint: endpoint) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let matchList = try decoder.decode([MatchModel].self, from: data)
                    completion(.success(matchList))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
