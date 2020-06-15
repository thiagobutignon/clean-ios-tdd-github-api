//
//  WeakVarProxy.swift
//  Main
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Presentation

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
    func showIssues(viewModel: DisplayIssuesViewModel) {
        instance?.showIssues(viewModel: viewModel)
    }
}
