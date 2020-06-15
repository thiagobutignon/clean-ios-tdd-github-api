//
//  TestFactories.swift
//  PresentationTests
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Presentation
import Domain

func makeIssueDetailRequest() -> IssueDetailRequest {
    return IssueDetailRequest(id: 0, number: 0, url: "any_url", title: "any_title", body: "any_body", createdAt: "any_createdAt", user: makeUserRequest())
}

func makeUserRequest() -> User {
    return User(id: 0, avatarUrl: "any_avatarUrl")
}


func makeIssuesRequest() -> IssuesRequest {
    return IssuesRequest(id: 0, title: "any_title", state: "any_state", number: 0)
}

func makeSuccessAlertViewModel(message: String) -> AlertViewModel {
    return AlertViewModel(title: "Sucesso", message: message)
}

func makeErrorAlertViewModel(message: String) -> AlertViewModel {
    return AlertViewModel(title: "Erro", message: message)
}
