//
//  IssueRequest.swift
//  Presentation
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

public struct IssuesRequest: Model {
    public var id: Int?
    public var title: String?
    public var state: String?
    public var number: Int?
    
    public init(id: Int?, title: String?, state: String?, number: Int?) {
        self.id = id
        self.title = title
        self.state = state
        self.number = number
    }
    
    public func toIssuesModel() -> IssuesModel {
        var issues = IssuesModel(issues: [])
        issues.issues.append(Issue(id: id!, title: title!, state: state!, number: number!))
        return issues
    }
}
