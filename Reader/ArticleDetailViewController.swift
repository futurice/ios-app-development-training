//
//  ArticleDetailViewController.swift
//  Reader
//
//  Created by Martin Richter on 18/09/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    var article: Article? {
        didSet {
            configureView()
        }
    }

    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }

    private func configureView() {
        self.title = article?.title

        if let webView = self.webView, articleURL = article?.url {
            let request = NSURLRequest(URL: articleURL)
            webView.loadRequest(request)
        }
    }
}
