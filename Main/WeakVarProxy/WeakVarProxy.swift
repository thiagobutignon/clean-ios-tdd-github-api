//
//  WeakVarProxy.swift
//  Main
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Presentation
import Domain

class WeakVarProxy<T: AnyObject> {
    private weak var instance: T?
    
    init(_ instance: T) {
        self.instance = instance
    }
}

extension WeakVarProxy: AlertView where T: AlertView {
    func showMessage(viewModel: AlertViewModel) {
        instance?.showMessage(viewModel: viewModel)
    }
}

extension WeakVarProxy: LoadingView where T: LoadingView {
    func display(viewModel: LoadingViewModel) {
        instance?.display(viewModel: viewModel)
    }
}

extension WeakVarProxy: DisplayIssuesView where T: DisplayIssuesView {
    func route(viewModel: Issue) {
        instance?.route(viewModel: viewModel)
    }
    
    func showIssues(viewModel: DisplayIssuesViewModel) {
        instance?.showIssues(viewModel: viewModel)
    }
}

extension WeakVarProxy: DisplayIssueDetailView where T: DisplayIssueDetailView {
    func showIssueDetail(viewModel: DisplayIssueDetailViewModel) {
        instance?.showIssueDetail(viewModel: viewModel)
    }
}
