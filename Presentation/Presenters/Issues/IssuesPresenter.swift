//
//  IssuePresenter.swift
//  Presentation
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

public final class IssuesPresenter {
    private let alertView: AlertView
    private let loadingView: LoadingView
    private let getIssues: GetIssues
    
    public init(alertView: AlertView, loadingView: LoadingView, getIssues: GetIssues) {
        self.alertView = alertView
        self.loadingView = loadingView
        self.getIssues = getIssues
    }
    
    
}
