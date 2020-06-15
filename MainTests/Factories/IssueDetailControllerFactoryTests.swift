
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

class IssueDetailControllerFactoryTests: XCTestCase {
    func test_background_request_should_complete_on_main_thread() {
        let (sut, getIssueDetailSpy) = makeSut()
        sut.loadViewIfNeeded()
        sut.loadIssueDetail?(makeIssueDetailRequest())
        let exp = expectation(description: "waiting")
        DispatchQueue.global().async {
            getIssueDetailSpy.completeWithError(.unexpected)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
}

extension IssueDetailControllerFactoryTests {
    func makeSut(file: StaticString = #file, line: UInt = #line) -> (sut: IssueDetailViewController, getIssueDetail: GetIssueDetailSpy) {
    let getIssueDetailSpy = GetIssueDetailSpy()
    let sut = makeIssueDetailFactoryWith(getIssueDetail: getIssueDetailSpy)
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: getIssueDetailSpy, file: file, line: line)
        return(sut, getIssueDetailSpy)
    }
}
