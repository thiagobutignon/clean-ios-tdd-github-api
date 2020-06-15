//
//  IssuesViewController.swift
//  UI
//
//  Created by Thiago B Claramunt on 15/06/20.
//  Copyright © 2020 Thiago B Claramunt. All rights reserved.
//

import Foundation
import UIKit
import Presentation

public final class IssuesViewController: UIViewController, Storyboarded {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var viewModel: DisplayIssuesViewModel?
    
    
    public var loadIssues: ((IssuesRequest) -> Void)?
    
    public var detail: (() -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        title = "Issues - Swift"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let viewModel = IssuesRequest(id: 0, title: "title", state: "open", number: 0)
        loadIssues?(viewModel)
    }
}

extension IssuesViewController: LoadingView {
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

extension IssuesViewController: AlertView {
    public func showMessage(viewModel: AlertViewModel) {
        let alert: UIAlertController = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}

extension IssuesViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let issue = self.viewModel?.currentIssue(indexPath: indexPath.row) else { return UITableViewCell()}
        if let cell = tableView.dequeueReusableCell(withIdentifier: "issueCell", for: indexPath) as? IssueCell {
            cell.titleLabel.text = issue.title
            cell.stateLabel.text = issue.state
            return cell
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "IssueDetailViewController", sender: self)
    }
}

extension IssuesViewController: DisplayIssuesView {
    public func showIssues(viewModel: DisplayIssuesViewModel) {
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
}
