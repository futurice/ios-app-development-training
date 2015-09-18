//
//  ArticleStore.swift
//  Reader
//
//  Created by Martin Richter on 18/09/15.
//  Copyright © 2015 Futurice. All rights reserved.
//

import Foundation
import Kanna

class ArticleStore {

    typealias SuccessHandler = [Article] -> Void // a function taking an Article array and returning nothing

    func fetchArticles(success success: SuccessHandler) {
        let articlesURL = NSURL(string: "http://feeds.bbci.co.uk/news/rss.xml")!

        let task = NSURLSession.sharedSession().dataTaskWithURL(articlesURL) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                guard let xml = Kanna.XML(xml: data, encoding: NSUTF8StringEncoding) else {
                    print("Couldn't parse XML file")
                    return
                }

                var articles: [Article] = []

                for item in xml.xpath("//item") {
                    if let title = item.xpath("title").text,
                        description = item.xpath("description").text,
                        linkString = item.xpath("link").text,
                        url = NSURL(string: linkString) {
                            let article = Article(title: title, description: description, url: url)
                            articles.append(article)
                    }
                }

                success(articles)
            } else {
                print("Something else went wrong")
            }
        }

        task.resume()
    }
}