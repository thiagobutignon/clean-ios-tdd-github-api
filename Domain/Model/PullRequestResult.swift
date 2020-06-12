//
//  PullRequestResult.swift
//  Domain
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public struct PullRequestResult: Model{
    public var url: String
    public var htmlURL: String
    public var diffURL: String
    public var patchURL: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case diffURL = "diff_url"
        case patchURL = "patch_url"
    }
    
    public init(url: String, htmlURL: String, diffURL: String, patchURL: String) {
        self.url = url
        self.htmlURL = htmlURL
        self.diffURL = diffURL
        self.patchURL = patchURL
    }
    
}
