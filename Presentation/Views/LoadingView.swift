//
//  LoadingView.swift
//  Presentation
//
//  Created by Thiago B Claramunt on 14/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation

public protocol LoadingView {
    func display(viewModel: LoadingViewModel)
}

public struct LoadingViewModel: Equatable {
    public var isLoading: Bool
    
    public init(isLoading: Bool) {
        self.isLoading = isLoading
    }
}
