//
//  GetIssuesSpy.swift
//  PresentationTests
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

class GetIssuesSpy: GetIssues {
    var completion: ((Result<[Issue], DomainError>) -> Void)?
    
    func get(completion: @escaping (GetIssues.Result) -> Void) {
        self.completion = completion
    }
    
    func completeWithError(_ error: DomainError) {
        completion?(.failure(error))
    }
    
    func completeWithIssue(_ issues: [Issue]) {
        completion?(.success(issues))
    }
}
