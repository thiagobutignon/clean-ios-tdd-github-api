//
//  IssueModelResult.swift
//  Domain
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public struct IssueModelResult: Model {
    public var url: String
    public var repositoryURL: String
    public var labelsURL: String
    public var commentsURL: String
    public var eventsURL: String
    public var htmlURL: String
    public var id: Int
    public var nodeID: String
    public var number: Int
    public var title: String
    public var user: UserModelResult
    public var labels: [LabelModelResult]
    public var state: String
    public var locked: Bool
    public var assignee: UserModelResult
    public var assignees: [UserModelResult]
    public var milestone: String
    public var comments: Int
    public var createdAt: String
    public var updatedAt: String
    public var closedAt: String
    public var authorAssociation: String
    public var activeLockReason: String
    public var pullRequest: PullRequestResult
    
    enum CodingKeys: String, CodingKey {
        case url
        case repositoryURL = "repository_url"
        case labelsURL = "labels_url"
        case commentsURL = "comments_url"
        case eventsURL = "events_url"
        case htmlURL = "html_url"
        case id
        case nodeID = "node_id"
        case number
        case title
        case user
        case labels
        case state
        case locked
        case assignee
        case assignees
        case milestone
        case comments
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case authorAssociation = "author_association"
        case activeLockReason = "active_lock_reason"
        case pullRequest = "pull_request"
    }
    
    public init(url: String, repositoryURL: String, labelsURL: String, commentsURL: String, eventsURL: String, htmlURL: String, id: Int, nodeID: String, number: Int, title: String, user: UserModelResult, labels: [LabelModelResult], state: String, locked: Bool, assignee: UserModelResult, assignees: [UserModelResult], milestone: String, comments: Int, createdAt: String, updatedAt: String, closedAt: String, authorAssociation: String, activeLockReason: String, pullRequest: PullRequestResult) {
        self.url = url
        self.repositoryURL = repositoryURL
        self.labelsURL = labelsURL
        self.commentsURL = commentsURL
        self.eventsURL = eventsURL
        self.htmlURL = htmlURL
        self.id = id
        self.nodeID = nodeID
        self.number = number
        self.title = title
        self.user = user
        self.labels = labels
        self.state = state
        self.locked = locked
        self.assignee = assignee
        self.assignees = assignees
        self.milestone = milestone
        self.comments = comments
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.closedAt = closedAt
        self.authorAssociation = authorAssociation
        self.activeLockReason = activeLockReason
        self.pullRequest = pullRequest
    }
}
