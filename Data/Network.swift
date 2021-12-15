//
//  Network.swift
//  AGMockServerDemo
//
//  Created by Alex Golovenkov on 16.12.2021.
//

import Foundation
import AGMockServer

class NetworkDataProvider {
    static var shared = NetworkDataProvider()
    
    var session: URLSession = AGMockServer.shared.hackedSession(for: URLSession.shared)
}
