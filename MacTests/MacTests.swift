//
//  MacTests.swift
//  MacTests
//
//  Created by Alex Golovenkov on 17.12.2021.
//

import XCTest
import AGMockServer
@testable import AGMockServerDemo

class MacTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        AGMockServer.shared.unregisterAllHandlers()
    }

    func testNotHackedAddress() async throws {
        let feed = try await NetworkDataProvider.shared.feed()
        XCTAssertTrue(feed.title == "JSON Feed")
        XCTAssertTrue(feed.home_page_url == "https://www.jsonfeed.org/")
        XCTAssertTrue(feed.items?.count == 2)
    }
    
    func testHackedRespose() async throws {
        AGMockServer.shared.registerHandler(FeedHandler())
        let feed = try await NetworkDataProvider.shared.feed()
        XCTAssertTrue(feed.title == "Hacked Feed")
        XCTAssertTrue(feed.home_page_url == "https://localhost/")
        XCTAssertTrue(feed.items?.count == 1)
    }

}
