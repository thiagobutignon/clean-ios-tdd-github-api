//
//  IssueModelFactory.swift
//  DataTests
//
//  Created by Thiago B Claramunt on 12/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

func makeIssuesModel() -> IssuesModel {
    return IssuesModel(issues: [makeIssue()])
}

func makeIssue() -> IssueModelResult {
    return IssueModelResult(url: "any_url", repositoryURL: "any_repositoryURL", labelsURL: "any_labelsURL", commentsURL: "any_commentsURL", eventsURL: "any_eventsURL", htmlURL: "any_eventsURL", id: 0, nodeID: "any_nodeID", number: 0, title: "any_title", user: makeUserModelResult(), labels: [makeLabelResult()], state: "any_state", locked: false, assignee: makeUserModelResult(), assignees: [makeUserModelResult()], milestone: "any_milestone", comments: 0, createdAt: "any_createdAt", updatedAt: "any_updatedAt", closedAt: "any_closedAt", authorAssociation: "any_authorAssociation", activeLockReason: "any_activeLockReason", pullRequest: makePullRequestResult())
}
func makeUserModelResult() -> UserModelResult{
    return UserModelResult(login: "any_login", id: 0, nodeID: "any_nodeID", avatarURL: "any_avatarURL", gravatarID: "any_gravatarID", url: "any_url", htmlURL: "any_htmlURL", followersURL: "any_followersURL", followingURL: "any_followingURL", gistsURL: "any_gistsURL", starredURL: "any_starredURL", subscriptionsURL: "any_subscriptionsURL", organizationsURL: "any_organizationsURL", reposURL: "any_reposURL", eventsURL: "any_eventsURL", receivedEventsURL: "any_receivedEventsURL", type: "any_type", siteAdmin: false)
}

func makeLabelResult() -> LabelModelResult {
    return LabelModelResult(id: 0, nodeID: "any_nodeID", url: "any_url", name: "any_name", description: "any_description", color: "any_color", gitDefault: false)
}
func makePullRequestResult() -> PullRequestResult {
    return PullRequestResult(url: "any_url", htmlURL: "any_htmlURL", diffURL: "any_diffURL", patchURL: "any_patchURL")
}
