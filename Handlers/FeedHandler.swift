//
//  FeedHandler.swift
//  AGMockServerDemo
//
//  Created by Alex Golovenkov on 17.12.2021.
//

import Foundation
import AGMockServer

class FeedHandler: AGMRequestHandler {
    let urlFormat = "feed.json"
    
    func defaultData(for url: URL) -> Data {
        let textResponse = """
{
    "version": "https://jsonfeed.org/version/1",
    "title": "Hacked Feed",
    "icon": "https://micro.blog/jsonfeed/avatar.jpg",
    "home_page_url": "https://localhost/",
    "feed_url": "https://www.jsonfeed.org/feed.json",
    "items": [
            {
                "id": "http://jsonfeed.micro.blog/2020/08/07/json-feed-version.html",
                "title": "Hacked Feed Item",
                "content_html": "Hello world!",
                "date_published": "2020-08-07T11:44:36-05:00",
                "url": "Localhost"
            }
    ]
}
"""
        return textResponse.data(using: .utf8) ?? Data()
    }
}
