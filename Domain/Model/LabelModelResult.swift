//
//  LabelResult.swift
//  Domain
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public struct LabelModelResult: Model {
    public var id: Int
    public var nodeID: String
    public var url: String
    public var name: String
    public var description: String
    public var color: String
    public var gitDefault: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case url
        case gitDefault = "default"
        case name
        case description
        case color
    }
    
    public init(id: Int, nodeID: String, url: String, name: String, description: String, color: String, gitDefault: Bool) {
        self.id = id
        self.nodeID = nodeID
        self.url = url
        self.name = name
        self.description = description
        self.color = color
        self.gitDefault = gitDefault
    }
}
