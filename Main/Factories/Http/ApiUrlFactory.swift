//
//  ApiUrlFactory.swift
//  Main
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

func makeApiUrl(path: String) -> URL {
    return (URL(string: "https://api.github.com/repos/apple/swift/issues/\(path)"))!
}

func makeApiUrl() -> URL {
    return (URL(string: "https://api.github.com/repos/apple/swift/issues"))!
}
