//
//  IssuesControllerFactory.swift
//  Main
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import UI
import Presentation
import Domain

public func makeIssueDetailFactory() -> IssueDetailViewController {
    return makeIssueDetailFactoryWith(getIssueDetail: makeRemoteGetIssueDetailFactory())
}

public func makeIssueDetailFactoryWith(getIssueDetail: GetIssueDetail) -> IssueDetailViewController {
    let controller = IssueDetailViewController.instantiate()
    let presenter = IssueDetailPresenter(issuesDetailView: WeakVarProxy(controller), alertView: WeakVarProxy(controller), loadingView: WeakVarProxy(controller), getIssueDetail: getIssueDetail)
    controller.loadIssueDetail = presenter.show
    return controller
}

public func makeIssuesRouter(nav: NavigationController) -> IssuesViewController {
    let controller = IssuesViewController.instantiate()
    let router = IssuesRouter(nav: nav, detailFactory: makeIssueDetailFactory)
    controller.detail = router.goToDetail
    return controller
}

public func makeIssuesController() -> IssuesViewController {
    return makeIssuesControllerWith(getIssues: makeRemoteGetIssues())
}

public func makeIssuesControllerWith(getIssues: GetIssues) -> IssuesViewController {
    let controller = IssuesViewController.instantiate()
    let presenter = IssuesPresenter(issuesView: WeakVarProxy(controller), alertView: WeakVarProxy(controller), loadingView: WeakVarProxy(controller), getIssues: getIssues)
    controller.loadIssues = presenter.show
    return controller
}
