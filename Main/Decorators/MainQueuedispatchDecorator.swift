//
//  MainQueuedispatchDecorator.swift
//  Main
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import Domain

public final class MainQueueDispatchDecorator<T> {
    private let instance: T
    
    public init(_ instance: T) {
        self.instance = instance
    }
    
    func dispatch(completion: @escaping () -> Void) {
        guard Thread.isMainThread else {
            return DispatchQueue.main.async(execute: completion)
        }
        completion()
    }
}

extension MainQueueDispatchDecorator: GetIssues where T: GetIssues {
    public func get(completion: @escaping (GetIssues.Result) -> Void) {
        instance.get { [weak self] result in
            self?.dispatch {
                completion(result)
            }
        }
    }
}

