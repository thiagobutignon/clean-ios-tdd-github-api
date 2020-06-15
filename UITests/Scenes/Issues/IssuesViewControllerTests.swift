//
//  IssuesViewControllerTests.swift
//  UITests
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import XCTest
import UIKit
import Presentation
@testable import UI

class IssuesViewControllerTests: XCTestCase {
    func test_loading_is_hidden_on_start() {
        XCTAssertEqual(makeSut().loadingIndicator?.isAnimating, false)
    }
    
    func test_sut_implements_loadingView() {
        XCTAssertNotNil(makeSut() as LoadingView)
    }
    
    func test_sut_implements_alertView() {
        XCTAssertNotNil(makeSut() as AlertView)
    }
    
    func test_sut_implements_displayIssuesView() {
        XCTAssertNotNil(makeSut() as DisplayIssuesView)
    }
    
    func test_sut_implements_tableViewDataSource() {
        XCTAssertNotNil(makeSut() as UITableViewDataSource)
    }
    
    func test_sut_implements_tableViewDelegate() {
        XCTAssertNotNil(makeSut() as UITableViewDelegate)
    }
}

extension IssuesViewControllerTests {
    func makeSut(issuesSpy: ((IssuesRequest) -> Void)? = nil, file: StaticString = #file, line: UInt = #line) -> IssuesViewController {
        let sut = IssuesViewController.instantiate()
        sut.loadIssues = issuesSpy
        sut.loadViewIfNeeded()
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
