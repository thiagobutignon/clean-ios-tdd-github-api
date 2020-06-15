//
//  IssueDetailModelFactory.swift
//  DataTests
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

func makeIssueDetail() -> IssueDetail {
    return IssueDetail(id: 0, number: 0, url: "any_url", title: "any_title", body: "any_body", createdAt: "any_createdAt", user: makeUser())
}

func makeUser() -> User {
    return User(id: 0, avatarUrl: "any_avatarUrl")
}
