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
    private var issuesView: DisplayIssuesView
    private let alertView: AlertView
    private let loadingView: LoadingView
    private let getIssues: GetIssues
    
    public init(issuesView: DisplayIssuesView, alertView: AlertView, loadingView: LoadingView, getIssues: GetIssues) {
        self.issuesView = issuesView
        self.alertView = alertView
        self.loadingView = loadingView
        self.getIssues = getIssues
    }
    
    public func show(viewModel: IssuesRequest) {
        loadingView.display(viewModel: LoadingViewModel(isLoading: true))
        getIssues.get { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .failure:
                    self.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: "Você está sem conexão, tente novamente mais tarde"))
                case .success(let issue):
                    self.issuesView.showIssues(viewModel: DisplayIssuesViewModel(data: issue))
            }
            self.loadingView.display(viewModel: LoadingViewModel(isLoading: false))
        }
    }
}
