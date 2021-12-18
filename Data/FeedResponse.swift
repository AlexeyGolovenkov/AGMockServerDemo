//
//  FeedResponse.swift
//  AGMockServerDemo
//
//  Created by Alex Golovenkov on 17.12.2021.
//

import Foundation

struct FeedResponse: Decodable {
    let version: String?
    let title: String?
    let icon: String?
    let home_page_url: String?
    let feed_url: String?
    let items: [FeedResponseItem]?
}
