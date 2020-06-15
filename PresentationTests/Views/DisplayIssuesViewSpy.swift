//
//  DisplayIssuesView.swift
//  PresentationTests
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Presentation
import Domain

class DisplayIssuesViewSpy: DisplayIssuesView {
    var emit: ((DisplayIssuesViewModel) -> Void)?
    var route: ((Issue) -> Void)?
    
    func observe(completion: @escaping (DisplayIssuesViewModel) -> Void) {
        self.emit = completion
    }
    
    func showIssues(viewModel: DisplayIssuesViewModel) {
        self.emit?(viewModel)
    }
    
    func route(viewModel: Issue) {
        self.route?(viewModel)
    }
}
