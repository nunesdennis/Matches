//
//  EndpointProtocol.swift
//  Matches
//
//  Created by Dennis Nunes on 05/04/23.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String { get }
    var endpoint: String { get }
    var queryItems: [URLQueryItem] { get }
    var isTokenNeeded: Bool { get }
    var header: [String: String] { get }
    var method: String { get }
    var url: URL? { get }
}

extension EndpointProtocol {
    var baseURL: String {
        "https://api.pandascore.co"
    }
    
    var isTokenNeeded: Bool {
        true
    }
    
    var method: String {
        "GET"
    }
    
    var header: [String: String] {
        [
            "accept": "application/json",
        ]
    }
    
    var url: URL? {
        let urlString = baseURL + endpoint
        var components = URLComponents(string: urlString)
        components?.queryItems = queryItems
        
        return components?.url
    }
}
