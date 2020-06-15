//
//  IssueDetailRequest.swift
//  Presentation
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

public struct IssueDetailRequest: Model {
    public var id: Int?
    public var number: Int?
    public var url: String?
    public var title: String?
    public var body: String?
    public var createdAt: String?
    public var user: User?
    
    public init(id: Int?, number: Int?, url: String?, title: String?, body: String?, createdAt: String?, user: User?) {
        self.id = id
        self.number = number
        self.url = url
        self.title = title
        self.body = body
        self.createdAt = createdAt
        self.user = user
    }
    
    public func fromUserParamsTo(id: Int, avatarUrl: String) -> User {
        return User(id: id, avatarUrl: avatarUrl)
    }
    
    public func toGetIssueDetailModel() -> GetIssueDetailModel {
        return GetIssueDetailModel(issue: IssueDetail(id: id!, number: number!, url: url!, title: title!, body: body!, createdAt: createdAt!, user: fromUserParamsTo(id: user!.id, avatarUrl: user!.avatarUrl)))
    }
}
