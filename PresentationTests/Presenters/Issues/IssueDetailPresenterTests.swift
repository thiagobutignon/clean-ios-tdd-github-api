//
//  IssuesPresenterTests.swift
//  PresentationTests
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import XCTest
import Presentation
import Domain

class IssueDetailPresenterTests: XCTestCase {
    func test_get_issue_detail_should_show_error_message_if_show_fails() {
        let alertViewSpy = AlertViewSpy()
        let getIssueDetailSpy = GetIssueDetailSpy()
        let sut = makeSut(alertView: alertViewSpy, getIssueDetail: getIssueDetailSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, makeErrorAlertViewModel(message: "Você está sem conexão, tente novamente mais tarde"))
            exp.fulfill()
        }
        sut.show(viewModel: makeIssueDetailRequest())
        getIssueDetailSpy.completeWithError(.unexpected)
        wait(for: [exp], timeout: 1)
    }
    
    func test_get_issue_detail_should_show_success_message_if_show_succeds() {
        let alertViewSpy = AlertViewSpy()
        let getIssueDetailSpy = GetIssueDetailSpy()
        let sut = makeSut(alertView: alertViewSpy, getIssueDetail: getIssueDetailSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, makeSuccessAlertViewModel(message: "Conseguimos carregar as Issues da linguagem Swift no Github"))
            exp.fulfill()
        }
        sut.show(viewModel: makeIssueDetailRequest())

        getIssueDetailSpy.completeWithIssueDetail(makeIssueDetail())
        wait(for: [exp], timeout: 1)
    }
    
    func test_get_issue_detail_should_calls_displayIssuesView_on_success() {
        let displayIssueDetailViewSpy = DisplayIssueDetailViewSpy()
        let getIssueDetailSpy = GetIssueDetailSpy()
        let sut = makeSut(issueDetailView: displayIssueDetailViewSpy, getIssueDetail: getIssueDetailSpy)
        let exp = expectation(description: "waiting")
        
        getIssueDetailSpy.get { viewModel in
            switch viewModel {
                case .failure:
                    XCTFail("Expected success got: \(viewModel) instead")
                case .success(let issueDetail):
                    XCTAssertEqual(issueDetail, makeIssueDetail())
            }
            exp.fulfill()
        }
        getIssueDetailSpy.completeWithIssueDetail(makeIssueDetail())
        sut.show(viewModel: makeIssueDetailRequest())
        
        wait(for: [exp], timeout: 1)
    }
    
    func test_get_issue_detail_should_show_loading_before_and_after_show() {
        let loadingViewSpy = LoadingViewSpy()
        let getIssueDetailSpy = GetIssueDetailSpy()
        let sut = makeSut(loadingView: loadingViewSpy, getIssueDetail: getIssueDetailSpy)
        let exp = expectation(description: "waiting")
        loadingViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, LoadingViewModel(isLoading: true))
            exp.fulfill()
        }
        
        sut.show(viewModel: makeIssueDetailRequest())
        wait(for: [exp], timeout: 1)
        
        let exp2 = expectation(description: "waiting")
        loadingViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, LoadingViewModel(isLoading: false))
            exp2.fulfill()
        }
        getIssueDetailSpy.completeWithError(.unexpected)
        wait(for: [exp2], timeout: 1)
    }
}

extension IssueDetailPresenterTests {
    func makeSut(issueDetailView: DisplayIssueDetailView = DisplayIssueDetailViewSpy(), alertView: AlertViewSpy = AlertViewSpy(), loadingView: LoadingView = LoadingViewSpy(), getIssueDetail: GetIssueDetailSpy = GetIssueDetailSpy(), file: StaticString = #file, line: UInt = #line) -> IssueDetailPresenter {
        let sut = IssueDetailPresenter(issuesDetailView: issueDetailView, alertView: alertView, loadingView: loadingView, getIssueDetail: getIssueDetail)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
