//
//  RemoteGetIssuesTests.swift
//  DataTests
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import XCTest
import Data
import Domain

class RemoteGetIssuesTests: XCTestCase {
    func test_get_should_call_httpClient_with_correct_url() {
        let url = makeUrl()
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.get { _ in }
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    
    func test_get_should_call_httpClient_and_get_data() {
        let (sut, _) = makeSut()
        let getIssuesModel = makeGetIssueModelResult()
        sut.get { _ in }
        XCTAssertNotNil(getIssuesModel)
    }
    
    func test_get_should_complete_with_error_if_client_completes_with_error() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.unexpected), when: {
            httpClientSpy.completeWithError(.noConnectivity)
        })
    }
    
    func test_get_should_complete_with_issues_if_client_completes_with_valid_data() {
        let (sut, httpClientSpy) = makeSut()
        let issues = makeIssuesModelResult()
        expect(sut, completeWith: .success(issues), when:  {
            httpClientSpy.completeWithSuccess(issues.toData()!)
        })
    }
    
    func test_get_should_complete_with_error_if_cliente_completes_with_invalid_data() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.unexpected), when: {
            httpClientSpy.completeWithSuccess(makeInvalidData())
        })
    }
    
    func test_get_should_not_complete_if_sut_has_been_deallocated() {
        let httpClientSpy = HttpClientSpy()
        var sut: RemoteGetIssues? = RemoteGetIssues(url: makeUrl(), httpClient: httpClientSpy)
        var result: Result<IssuesModelResult, DomainError>?
        sut?.get(completion: { result = $0 })
        sut = nil
        httpClientSpy.completeWithError(.noConnectivity)
        XCTAssertNil(result)
        
    }
    
}

extension RemoteGetIssuesTests {
    func makeSut(url: URL = URL(string: "http://any-url.com")!, file: StaticString = #file, line: UInt = #line) -> (sut: RemoteGetIssues, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteGetIssues(url: url, httpClient: httpClientSpy)
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: httpClientSpy, file: file, line: line)
        return (sut, httpClientSpy)
    }
    
    func expect(_ sut: RemoteGetIssues, completeWith expectedResult: GetIssues.Result, when action: () -> Void, file: StaticString = #file, line: UInt = #line) {
        let exp = expectation(description: "waiting")
        sut.get { receivedResult in
            switch (expectedResult, receivedResult) {
                case (.failure(let expectedError), .failure(let receivedError)):
                    XCTAssertEqual(expectedError, receivedError, file: file, line: line)
                case (.success(let expectedIssues), .success(let receivedIssues)):
                    XCTAssertEqual(expectedIssues, receivedIssues, file: file, line: line)
                default:
                    XCTFail("Expected \(expectedResult) error received \(receivedResult) instead", file: file, line: line)
            }
            exp.fulfill()
        }
        action()
        wait(for: [exp], timeout: 1)
    }
}
