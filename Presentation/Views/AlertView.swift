//
//  AlertView.swift
//  Presentation
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public protocol AlertView {
    func showMessage(viewModel: AlertViewModel)
}

public struct AlertViewModel: Equatable {
    public var title: String
    public var message: String
    
    public init(title: String, message: String) {
        self.title = title
        self.message = message
    }
}
