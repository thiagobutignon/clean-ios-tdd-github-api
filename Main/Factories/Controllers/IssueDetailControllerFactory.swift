//
//  IssueDetailControllerFactory.swift
//  Main
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import UI
import Presentation
import Domain

public func makeIssueDetailFactory(issueNumber: Int) -> IssueDetailViewController {
    return makeIssueDetailFactoryWith(getIssueDetail: makeRemoteGetIssueDetailFactory(issueNumber: issueNumber))
}

public func makeIssueDetailFactoryWith(getIssueDetail: GetIssueDetail) -> IssueDetailViewController {
    let controller = IssueDetailViewController.instantiate()
    let presenter = IssueDetailPresenter(issuesDetailView: WeakVarProxy(controller), alertView: WeakVarProxy(controller), loadingView: WeakVarProxy(controller), getIssueDetail: getIssueDetail)
    controller.loadIssueDetail = presenter.show
    return controller
}
