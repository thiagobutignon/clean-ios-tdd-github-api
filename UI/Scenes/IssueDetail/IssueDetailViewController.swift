//
//  IssueDetailViewController.swift
//  UI
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import UIKit
import Presentation
import Domain
import SDWebImage

public final class IssueDetailViewController: UIViewController, Storyboarded {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var createAtLabel: UILabel!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var avatarImage: UIImageView!

    var viewModel: DisplayIssueDetailViewModel?
    
    public var loadIssueDetail: ((IssueDetailRequest) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        title = "Details"
        
        let viewModel = IssueDetailRequest(id: 0, number: 0, url: "url", title: "title", body: "body", createdAt: "createdAt", user: User(id: 0, avatarUrl: ""))
        titleLabel.text = "Teste"
        linkButton?.layer.cornerRadius = 5
        linkButton?.backgroundColor = Color.primary
        linkButton?.addTarget(self, action: #selector(linkButtonTapped), for: .touchUpInside)
        loadIssueDetail?(viewModel)
    }
    
    @objc private func linkButtonTapped() {
        if let url = NSURL(string: "https://github.com/apple/swift/pull/\(viewModel!.data.number)") {
            UIApplication.shared.openURL(url as URL)
        }
    }
}

extension IssueDetailViewController: LoadingView {
    public func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            view.isUserInteractionEnabled = false
            loadingIndicator?.startAnimating()
        } else {
            view.isUserInteractionEnabled = true
            loadingIndicator.stopAnimating()
        }
    }
}

extension IssueDetailViewController: AlertView {
    public func showMessage(viewModel: AlertViewModel) {
        let alert: UIAlertController = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}

extension IssueDetailViewController: DisplayIssueDetailView {
    public func showIssueDetail(viewModel: DisplayIssueDetailViewModel) {
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.data.title
        self.bodyLabel.text = viewModel.data.body
        self.createAtLabel.text = viewModel.data.createdAt
        let imageUrl = viewModel.data.user.avatarUrl + "." + ".jpg"
        self.avatarImage.sd_setImage(with: URL(string: imageUrl))
    }
}
