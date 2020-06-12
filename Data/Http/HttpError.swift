//
//  HttpError.swift
//  Data
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public enum HttpError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
}
