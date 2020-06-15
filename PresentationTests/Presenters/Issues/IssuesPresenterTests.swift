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

class IssuesPresenterTests: XCTestCase {
    func test_get_issues_should_show_error_message_if_show_fails() {
        let alertViewSpy = AlertViewSpy()
        let getIssuesSpy = GetIssuesSpy()
        let sut = makeSut(alertView: alertViewSpy, getIssues: getIssuesSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, makeErrorAlertViewModel(message: "Você está sem conexão, tente novamente mais tarde"))
            exp.fulfill()
        }
        sut.show(viewModel: makeIssuesRequest())
        getIssuesSpy.completeWithError(.unexpected)
        wait(for: [exp], timeout: 1)
    }
    
    func test_get_issues_should_show_success_message_if_show_succeds() {
        let alertViewSpy = AlertViewSpy()
        let getIssuesSpy = GetIssuesSpy()
        let sut = makeSut(alertView: alertViewSpy, getIssues: getIssuesSpy)
        let exp = expectation(description: "waiting")
        alertViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, makeSuccessAlertViewModel(message: "Conseguimos carregar as Issues da linguagem Swift no Github"))
            exp.fulfill()
        }
        sut.show(viewModel: makeIssuesRequest())
        getIssuesSpy.completeWithIssue(makeIssueModel().issues)
        wait(for: [exp], timeout: 1)
    }

    
    func test_get_issues_should_calls_displayIssuesView_on_success() {
        let displayIssuesViewSpy = DisplayIssuesViewSpy()
        let getIssuesSpy = GetIssuesSpy()
        let sut = makeSut(issuesView: displayIssuesViewSpy, getIssues: getIssuesSpy)
        let exp = expectation(description: "waiting")
        
        getIssuesSpy.get { viewModel in
            switch viewModel {
                case .failure:
                    XCTFail("Expected success got: \(viewModel) instead")
                case .success(let issue):
                    XCTAssertEqual(issue, makeIssueModel().issues)
            }
            exp.fulfill()
        }
        getIssuesSpy.completeWithIssue(makeIssueModel().issues)
        sut.show(viewModel: makeIssuesRequest())
        
        wait(for: [exp], timeout: 1)
    }
    
    func test_get_issues_should_show_loading_before_and_after_show() {
        let loadingViewSpy = LoadingViewSpy()
        let getIssuesSpy = GetIssuesSpy()
        let sut = makeSut(loadingView: loadingViewSpy, getIssues: getIssuesSpy)
        let exp = expectation(description: "waiting")
        loadingViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, LoadingViewModel(isLoading: true))
            exp.fulfill()
        }
        
        sut.show(viewModel: makeIssuesRequest())
        wait(for: [exp], timeout: 1)
        
        let exp2 = expectation(description: "waiting")
        loadingViewSpy.observe { viewModel in
            XCTAssertEqual(viewModel, LoadingViewModel(isLoading: false))
            exp2.fulfill()
        }
        getIssuesSpy.completeWithError(.unexpected)
        wait(for: [exp2], timeout: 1)
    }
}

extension IssuesPresenterTests {
    func makeSut(issuesView: DisplayIssuesView = DisplayIssuesViewSpy(), alertView: AlertViewSpy = AlertViewSpy(), loadingView: LoadingView = LoadingViewSpy(), getIssues: GetIssuesSpy = GetIssuesSpy(), file: StaticString = #file, line: UInt = #line) -> IssuesPresenter {
        let sut = IssuesPresenter(issuesView: issuesView, alertView: alertView, loadingView: loadingView, getIssues: getIssues)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
