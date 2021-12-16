//
//  FeedResponseItem.swift
//  AGMockServerDemo
//
//  Created by Alex Golovenkov on 17.12.2021.
//

import Foundation

struct FeedResponseItem: Decodable {
    let id: String
    let title: String?
    let content_html: String?
    let url: String?
    let date_published: String?
}
