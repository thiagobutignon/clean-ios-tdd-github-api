//
//  DisplayIssuesDetailViewSpy.swift
//  PresentationTests
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Presentation

class DisplayIssueDetailViewSpy: DisplayIssueDetailView {
    var emit: ((DisplayIssueDetailViewModel) -> Void)?
    
    func observe(completion: @escaping (DisplayIssueDetailViewModel) -> Void) {
        self.emit = completion
    }
    
    func showIssueDetail(viewModel: DisplayIssueDetailViewModel) {
        self.emit?(viewModel)
    }
}
