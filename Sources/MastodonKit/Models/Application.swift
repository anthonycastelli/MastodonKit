//
//  Application.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Application: Codable, Hashable {
    /// Name of the app.
    public let name: String
    /// Homepage URL of the app.
    public let website: String?
}

extension Application: Identifiable {
    public var id: String { self.name }
}
