//
//  File.swift
//  Domain
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public protocol GetIssueDetail {
    typealias Result = Swift.Result<Issue, DomainError>
    func get(completion: @escaping (Result) -> Void)
}

public struct GetIssueDetailModel: Model {
    public let issue: Issue
    
    public init(issue: Issue) {
        self.issue = issue
    }
}
