//
//  ArticleStore.swift
//  Reader
//
//  Created by Martin Richter on 18/09/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

import Foundation

class ArticleStore {

    typealias SuccessHandler = [Article] -> Void // a function taking an Article array and returning nothing

    func fetchArticles(success success: SuccessHandler) {
        let articlesURL = NSURL(string: "http://feeds.bbci.co.uk/news/rss.xml")!

        let task = NSURLSession.sharedSession().dataTaskWithURL(articlesURL) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let _ = data {
                print("Got some data :)")
            }

            success([])
        }

        task.resume()
    }
}