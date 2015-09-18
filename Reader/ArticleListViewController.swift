//
//  ArticleListViewController.swift
//  Reader
//
//  Created by Martin Richter on 18/09/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

import UIKit

class ArticleListViewController: UITableViewController {

    // MARK: - UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // This is how many rows we want in the table
        return 5
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Dequeue a cell (this will auto-create one if none found)
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell")!

        // Configure the cell content
        cell.textLabel?.text = "Row \(indexPath.row)"

        return cell
    }
}