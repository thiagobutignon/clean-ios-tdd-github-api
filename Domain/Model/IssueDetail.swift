//
//  IssueDetail.swift
//  Domain
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public struct IssueDetail: Model {
    public var id: Int
    public var number: Int
    public var url: String
    public var title: String
    public var body: String
    public var createdAt: String
    public var user: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case number
        case url
        case title
        case body
        case createdAt = "created_at"
        case user
    }
    
    
    public init(id: Int, number: Int, url: String, title: String, body: String, createdAt: String, user: User) {
        self.id = id
        self.number = number
        self.url = url
        self.title = title
        self.body = body
        self.createdAt = createdAt
        self.user = user
    }
}


