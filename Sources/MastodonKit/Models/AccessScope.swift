//
//  AccessScope.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/17/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public enum AccessScope: String, Codable, Hashable {
    /// Allows reading data.
    case read
    /// Allows posting statuses and uploading media for statuses.
    case write
    /// Allows following, unfollowing, blocking, and unblocking users.
    case follow
    /// Allows subscribing to push notifications.
    case push
}

extension AccessScope: CaseIterable { }

extension AccessScope: Identifiable {
    public var id: AccessScope { self }
}
