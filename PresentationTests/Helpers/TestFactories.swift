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

func makeIssuesRequest() -> IssuesRequest {
    return IssuesRequest(id: 0, title: "any_title", state: "any_state", number: 0)
}

func makeSuccessAlertViewModel(message: String) -> AlertViewModel {
    return AlertViewModel(title: "Sucesso", message: message)
}

func makeErrorAlertViewModel(message: String) -> AlertViewModel {
    return AlertViewModel(title: "Erro", message: message)
}
