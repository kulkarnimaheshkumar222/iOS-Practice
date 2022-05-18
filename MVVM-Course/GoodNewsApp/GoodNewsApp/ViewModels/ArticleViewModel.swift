//
//  ArticleViewModel.swift
//  GoodNewsApp
//
//  Created by Mahesh Kulkarni on 18/05/22.
//

import Foundation


struct ArticleListViewModel {
     let articles: [ArticleModel]
}
struct ArticleViewModel {
    private let article: ArticleModel
}

extension ArticleViewModel {
    init(_ article: ArticleModel) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title
    }
    var description: String {
        return self.article.description
    }
}

extension ArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section:Int)-> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}
