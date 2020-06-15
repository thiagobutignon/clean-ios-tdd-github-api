//
//  IssueDetailPresenter.swift
//  Presentation
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

public final class IssueDetailPresenter {
    private var issuesDetailView: DisplayIssueDetailView
    private let alertView: AlertView
    private let loadingView: LoadingView
    private let getIssueDetail: GetIssueDetail
    
    public init(issuesDetailView: DisplayIssueDetailView, alertView: AlertView, loadingView: LoadingView, getIssueDetail: GetIssueDetail) {
        self.issuesDetailView = issuesDetailView
        self.alertView = alertView
        self.loadingView = loadingView
        self.getIssueDetail = getIssueDetail
    }
    
    public func show(viewModel: IssueDetailRequest) {
        loadingView.display(viewModel: LoadingViewModel(isLoading: true))

        getIssueDetail.get { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .failure:
                    self.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: "Você está sem conexão, tente novamente mais tarde"))
                case .success(let issue):
                    self.issuesDetailView.showIssueDetail(viewModel: DisplayIssueDetailViewModel(data: issue))
            }
            self.loadingView.display(viewModel: LoadingViewModel(isLoading: false))
        }
    }
}
