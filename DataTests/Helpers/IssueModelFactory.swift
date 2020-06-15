//
//  IssueModelFactory.swift
//  DataTests
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

func makeIssueList() -> [Issue] {
    return [makeIssue()]
}

func makeIssue() -> Issue {
    return Issue(id: 0, title: "any_title", state: "any_state")
}
