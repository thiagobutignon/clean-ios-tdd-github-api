//
//  DisplayIssuesView.swift
//  Presentation
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

public protocol DisplayIssuesView {
    func showIssues(viewModel: DisplayIssuesViewModel)
    func route(viewModel: Issue)
}

public struct DisplayIssuesViewModel: Equatable {
    public var data: [Issue]
    
    public init(data: [Issue]) {
        self.data = data
    }
    
    public var count: Int {
        return data.count
    }
    
    public func currentIssue(indexPath: Int) -> Issue {
        return self.data[indexPath]
    }
}
