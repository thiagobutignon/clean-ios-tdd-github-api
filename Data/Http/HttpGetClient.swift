//
//  HttpGetClient.swift
//  Data
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public protocol HttpGetClient {
    func get(to url: URL, completion: @escaping (Result<Data?, HttpError>) -> Void)
}
