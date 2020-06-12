//
//  HttpClientSpy.swift
//  DataTests
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Data

class HttpClientSpy: HttpGetClient {
    var urls: [URL] = [URL]()
    var completion: ((Result<Data?, HttpError>) -> Void)?
    
    func get(to url: URL, completion: @escaping (Result<Data?, HttpError>) -> Void) {
        self.urls.append(url)
        self.completion = completion
    }
    
    func completeWithError(_ error: HttpError) {
        completion?(.failure(error))
    }
    
    func completeWithSuccess(_ data: Data) {
        completion?(.success(data))
    }
}
