//
//  User.swift
//  Domain
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public struct User: Model {
    public var id: Int
    public var avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case avatarUrl = "avatar_url"
    }
    
    public init(id: Int, avatarUrl: String) {
        self.id = id
        self.avatarUrl = avatarUrl
    }
}
