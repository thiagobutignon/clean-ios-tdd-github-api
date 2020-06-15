//
//  IssuesRouter.swift
//  UI
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import UIKit
import Domain

public final class IssuesRouter {
    private let nav: NavigationController
    private let detailFactory: () -> IssueDetailViewController

    
    public init(nav: NavigationController, detailFactory: @escaping () -> IssueDetailViewController) {
        self.nav = nav
        self.detailFactory = detailFactory
    }
    
    public func goToDetail() {
        nav.pushViewController(detailFactory())
    }
}
