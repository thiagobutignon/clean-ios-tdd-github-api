//
//  Issue.swift
//  Domain
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public struct Issue: Model {
    public let id: Int
    public let title: String
    public let state: String
    public let number: Int
    
    public init(id: Int, title: String, state: String, number: Int) {
        self.id = id
        self.title = title
        self.state = state
        self.number = number
    }
}
