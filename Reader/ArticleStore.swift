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
        // Create some fake articles
        let fakeArticle1 = Article(
            title: "First article",
            description: "This is just a fake article.",
            url: NSURL(string: "http://www.apple.com")!
        )
        let fakeArticle2 = Article(
            title: "Second article",
            description: "Here is another one.",
            url: NSURL(string: "http://www.google.com")!
        )
        let fakeArticles = [fakeArticle1, fakeArticle2]

        // Call the success handler immediately
        success(fakeArticles)
    }
}