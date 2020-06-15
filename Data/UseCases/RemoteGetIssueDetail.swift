//
//  RemoteGetIssueDetail.swift
//  Data
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

public final class RemoteGetIssueDetail: GetIssueDetail {
    
    private let url: URL
    private let httpClient: HttpGetClient
    
    public init(url: URL, httpClient: HttpGetClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    public func get(completion: @escaping (GetIssueDetail.Result) -> Void) {
        httpClient.get(to: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
                case .success(let data):
                    if let model: IssueDetail = data?.toModel() {
                        print(model)
                        completion(.success(model))
                    } else {
                        completion(.failure(.unexpected))
                }
                case .failure:
                    print("---- deu erro 458x")
                    completion(.failure(.unexpected))
            }
        }
    }
}
