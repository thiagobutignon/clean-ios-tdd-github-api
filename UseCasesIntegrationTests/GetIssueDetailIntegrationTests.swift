//
//  GetIssueDetailIntegrationTests.swift
//  UseCasesIntegrationTests
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import XCTest
import Data
import Infra
import Domain
import Data

class GetIssueDetailIntegrationTests: XCTestCase {
    func test_get_issue_detail() {
        print("------------- Inicio do teste de Integração")
        let alamofireAdapter = AlamofireAdapter()
        let url: URL = URL(string: "https://api.github.com/repos/apple/swift/issues/32379")!
        let sut = RemoteGetIssueDetail(url: url, httpClient: alamofireAdapter)
        let exp = expectation(description: "waiting")
        sut.get { result in
            
            switch result {
                case .failure:
                    XCTFail("Expected success got \(result) instead")
                case .success(let issue):
                    XCTAssertNotNil(issue)
                    XCTAssertEqual(638425995, issue.id)
                    XCTAssertEqual(32379, issue.number)
                    XCTAssertEqual(63311, issue.user.id)
                    XCTAssertEqual("https://avatars3.githubusercontent.com/u/63311?v=4", issue.user.avatarUrl)
            }
            exp.fulfill()
        }
        checkMemoryLeak(for: sut)
        wait(for: [exp], timeout: 5)
    }
    
    
    func test_get_error() {
        let alamofireAdapter = AlamofireAdapter()
        let url: URL = URL(string: "https://api.github.com/repos/apple/swift/issues/000")!
        let sut = RemoteGetIssueDetail(url: url, httpClient: alamofireAdapter)
        
        let exp = expectation(description: "waiting")

        sut.get { result in
            switch result {
                case .failure(let error):
                XCTAssertNotNil(error)
                case .success:
                XCTFail("Expected failure got \(result)")
            }
            exp.fulfill()

        }
        checkMemoryLeak(for: sut)
        wait(for: [exp], timeout: 5)

    }
}
