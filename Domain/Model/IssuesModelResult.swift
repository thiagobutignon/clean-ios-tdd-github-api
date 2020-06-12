//
//  IssuesModelResult.swift
//  Domain
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public struct IssuesModelResult: Model {
    public var issues: [IssueModelResult]
    
    public init(issues: [IssueModelResult]) {
        self.issues = issues
    }
}


