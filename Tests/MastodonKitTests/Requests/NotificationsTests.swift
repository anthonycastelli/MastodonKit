//
//  NotificationsTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class NotificationsTests: XCTestCase {
    func testAll() {
        let request = Notifications.all()

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/notifications")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)
    }

    func testAllWithRange() {
        let request = Notifications.all(range: .max(id: "123", limit: 12))
        let expectedMaxID = URLQueryItem(name: "max_id", value: "123")
        let expectedLimit = URLQueryItem(name: "limit", value: "12")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/notifications")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedMaxID))
        XCTAssertTrue(request.method.queryItems!.contains(expectedLimit))
    }
    
    func testAllWithExcludingTypes() {
        let request = Notifications.all(excludingTypes: [.mention, .followRequest])
        let expectedMention = URLQueryItem(name: "exclude_types[]", value: "mention")
        let expectedFollowRequest = URLQueryItem(name: "exclude_types[]", value: "follow_request")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/notifications")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.httpBody)
        XCTAssertEqual(request.method.queryItems?.count, 2)
        XCTAssertTrue(request.method.queryItems!.contains(expectedMention))
        XCTAssertTrue(request.method.queryItems!.contains(expectedFollowRequest))
    }

    func testNotification() {
        let request = Notifications.notification(id: "42")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/notifications/42")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)
    }

    func testDismissAll() {
        let request = Notifications.dismissAll()

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/notifications/clear")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNil(request.method.httpBody)
    }

    func testDismissWithID() {
        let request = Notifications.dismiss(id: "42")

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/notifications/dismiss")

        // Method
        XCTAssertEqual(request.method.name, "POST")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 1)
        XCTAssertTrue(payload.contains("id=42"))
    }
}
