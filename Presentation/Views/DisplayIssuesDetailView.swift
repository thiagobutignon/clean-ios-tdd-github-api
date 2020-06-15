//
//  DisplayIssuesViewDetail.swift
//  Presentation
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

public protocol DisplayIssueDetailView {
    func showIssueDetail(viewModel: DisplayIssueDetailViewModel)
}

public struct DisplayIssueDetailViewModel: Equatable {
    public var data: IssueDetail
    
    public init(data: IssueDetail) {
        self.data = data
    }
}
