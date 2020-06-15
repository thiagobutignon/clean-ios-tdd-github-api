//
//  MainTests.swift
//  MainTests
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import XCTest
import Main
import UI
import Domain
import Presentation

class IssuesControllerFactory: XCTestCase {
    func test_background_request_should_complete_on_main_thread() {
        let (sut, getIssuesSpy) = makeSut()
        sut.loadViewIfNeeded()
        sut.showIssues(viewModel: DisplayIssuesViewModel(data: [Issue(id: 0, title: "any_title", state: "any_state", number: 0)]))
        let exp = expectation(description: "waiting")
        DispatchQueue.global().async {
            getIssuesSpy.completeWithError(.unexpected)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
    
    func test_background_request_should_call_route() {
        let (sut, getIssuesSpy) = makeSut()
        sut.loadViewIfNeeded()
        sut.route(viewModel: Issue(id: 0, title: "any_title", state: "any_state", number: 0))
        let exp = expectation(description: "waiting")
        DispatchQueue.global().async {
            getIssuesSpy.completeWithError(.unexpected)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
}

extension IssuesControllerFactory {
    func makeSut(file: StaticString = #file, line: UInt = #line) -> (sut: IssuesViewController, getIssues: GetIssuesSpy) {
    let getIssuesSpy = GetIssuesSpy()
    let sut = makeIssuesControllerWith(getIssues: getIssuesSpy)
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: getIssuesSpy, file: file, line: line)
        return(sut, getIssuesSpy)
    }
}
