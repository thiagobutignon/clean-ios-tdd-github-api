//
//  GetIssueDetail.swift
//  PresentationTests
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

class GetIssueDetailSpy: GetIssueDetail {
    var completion: ((Result<IssueDetail, DomainError>) -> Void)?
    
    func get(completion: @escaping (GetIssueDetail.Result) -> Void) {
        self.completion = completion
    }
    
    func completeWithError(_ error: DomainError) {
        completion?(.failure(error))
    }

    func completeWithIssueDetail(_ issueDetail: IssueDetail) {
        completion?(.success(issueDetail))
    }
}
