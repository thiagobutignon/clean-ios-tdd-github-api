//
//  UIViewControllerExtensions.swift
//  UI
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardOnTap() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}
