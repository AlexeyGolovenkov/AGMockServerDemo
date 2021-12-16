//
//  Network.swift
//  AGMockServerDemo
//
//  Created by Alex Golovenkov on 16.12.2021.
//

import Foundation
import AGMockServer
import SwiftUI

enum NetworkError: Error {
    case badUrl
    case parseError
}

class NetworkDataProvider {
    static var shared = NetworkDataProvider()
    
    var session: URLSession = AGMockServer.shared.hackedSession(for: URLSession.shared)
    
    func feed() async throws -> FeedResponse {
        guard let url = URL(string: "https://jsonfeed.org/feed.json") else {
            throw NetworkError.badUrl
        }
        let (data, _) = try await session.data(from: url)
        let parsedRespose = try JSONDecoder().decode(FeedResponse.self, from: data)
        return parsedRespose
    }
    
    func addHandler() {
        AGMockServer.shared.registerHandler(FeedHandler())
    }
    
    func removeHandler() {
        AGMockServer.shared.unregisterAllHandlers()
    }
}
