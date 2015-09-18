//
//  ArticleListViewController.swift
//  Reader
//
//  Created by Martin Richter on 18/09/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

import UIKit

class ArticleListViewController: UITableViewController {

    private let articles: [Article]

    // MARK: Lifecycle

    required init?(coder aDecoder: NSCoder) {
        let fakeArticle1 = Article(title: "First article", description: "This is just a fake article.")
        let fakeArticle2 = Article(title: "Second article", description: "Here is another one.")
        self.articles = [fakeArticle1, fakeArticle2]

        super.init(coder: aDecoder)
    }

    // MARK: - UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // This is how many rows we want in the table
        return articles.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Dequeue a cell (this will auto-create one if none found)
        let cell = tableView.dequeueReusableCellWithIdentifier("subtitledCell")!

        // Get the relevant article
        let article = articles[indexPath.row]

        // Configure the cell content
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.description

        return cell
    }
}