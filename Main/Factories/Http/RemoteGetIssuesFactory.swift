//
//  RemoteGetIssues.swift
//  Main
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Data
import Domain

func makeRemoteGetIssues() -> GetIssues {
    return makeRemoteGetIssuesWith(httpClient: makeAlamofireAdapter())
}

func makeRemoteGetIssuesWith(httpClient: HttpGetClient) -> GetIssues {
    let remoteGetIssues = RemoteGetIssues(url: makeApiUrl(), httpClient: httpClient)
    return MainQueueDispatchDecorator(remoteGetIssues)
}
