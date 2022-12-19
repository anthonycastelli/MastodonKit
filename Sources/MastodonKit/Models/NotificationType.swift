//
//  NotificationType.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum NotificationType: String, Codable, Hashable {
    /// The user has been mentioned.
    case mention
    /// The status message has been reblogged.
    case reblog
    /// The status message has been favourited.
    case favourite
    /// The user has a new follower.
    case follow
    /// When a user posts a status
    case status
    /// A poll you have voted in or created has ended
    case poll
    /// A status you interacted with has been edited
    case update
    /// Someone requested to follow you
    case followRequest = "follow_request"
}

extension NotificationType: CaseIterable { }

extension NotificationType: Identifiable {
    public var id: NotificationType { self }
}

extension Array where Element == NotificationType {
    func parameters() -> [Parameter] {
        return self.map({ Parameter(name: "exclude_types[]", value: $0.rawValue) })
    }
}
