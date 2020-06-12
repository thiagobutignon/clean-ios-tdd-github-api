//
//  IssuesModel.swift
//  Domain
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public protocol GetIssues {
    typealias Result = Swift.Result<IssuesModelResult, DomainError>
    func get(completion: @escaping (Result) -> Void)
}

public struct GetIssuesModel: Model {
    public var issues: IssuesModelResult
    
    public init(issues: IssuesModelResult) {
        self.issues = issues
    }
}
