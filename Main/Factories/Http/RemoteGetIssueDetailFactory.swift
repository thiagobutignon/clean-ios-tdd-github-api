//
//  RemoteGetIssueDetailFactory.swift
//  Main
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Data
import Domain

func makeRemoteGetIssueDetailFactory(issueNumber: Int) -> GetIssueDetail {
    return makeRemoteGetIssueDetailWith(httpClient: makeAlamofireAdapter(), issueNumber: issueNumber)
}

func makeRemoteGetIssueDetailWith(httpClient: HttpGetClient, issueNumber: Int) -> GetIssueDetail {
    let remoteGetIssueDetail = RemoteGetIssueDetail(url: makeApiUrl(path: "\(issueNumber)"), httpClient: makeAlamofireAdapter())
    return MainQueueDispatchDecorator(remoteGetIssueDetail)
}
