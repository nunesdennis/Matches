//
//  MatchesEndpoint.swift
//  Matches
//
//  Created by Dennis Nunes on 05/04/23.
//

import Foundation

struct MatchesEndpoint: EndpointProtocol {
    // MARK: - Properties
    private var params: MatchListParams?
    
    var queryItems: [URLQueryItem] {
        var query: [URLQueryItem] = []
        if let sort = sortQuery() { query.append(sort) }
        if let page = pageQuery() { query.append(page) }
        if let perPage = perPageQuery() { query.append(perPage) }
        
        return query
    }
    
    var endpoint: String {
        "/matches"
    }
    
    
    // MARK: - Initialization
    init(_ params: MatchListParams? = nil) {
        self.params = params
    }
    
    // MARK: - Private Methods
    private func sortQuery() -> URLQueryItem? {
        guard let sort = params?.sort else {
            return nil
        }
        
        return URLQueryItem(name: "sort", value: sort)
    }
    
    private func pageQuery() -> URLQueryItem? {
        guard let page = params?.page else {
            return nil
        }
        let pageString = String(page)
        
        return URLQueryItem(name: "page", value: pageString)
    }
    
    private func perPageQuery() -> URLQueryItem? {
        guard let perPage = params?.perPage else {
            return nil
        }
        let perPageString = String(perPage)
        
        return URLQueryItem(name: "per_page", value: perPageString)
    }
}
