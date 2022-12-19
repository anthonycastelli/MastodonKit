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
    /// A poll notification
    case poll
    /// Update status type
    case update
}

extension NotificationType: CaseIterable { }

extension NotificationType: Identifiable {
    public var id: NotificationType { self }
}
