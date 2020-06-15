//
//  TestExtensions.swift
//  UITests
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach {
            target in
            actions(forTarget: target, forControlEvent: event)?.forEach({ action in (target as NSObject).perform(Selector(action))})
        }
    }
    
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
