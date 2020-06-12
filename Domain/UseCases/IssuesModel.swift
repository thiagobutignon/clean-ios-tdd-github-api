//
//  IssuesModel.swift
//  Domain
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public protocol Issues {
    typealias Result = Swift.Result<IssuesModelResult, DomainError>
    func get(issuesModel: IssuesModel, completion: @escaping (Result) -> Void)
}

public struct IssuesModel: Model {
    public var issues: [Issue]
    
    public init(issues: [Issue]) {
        self.issues = issues
    }
}
