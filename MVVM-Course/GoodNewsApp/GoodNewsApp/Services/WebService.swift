//
//  WebService.swift
//  GoodNewsApp
//
//  Created by Mahesh Kulkarni on 18/05/22.
//

import Foundation

class WebService {
    
    func getArticles(url: URL, completion: @escaping ([ArticleModel]?)->Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
               let articleList = try? JSONDecoder().decode(ArticleListModel.self, from: data)
                if let articleList = articleList{
                    completion(articleList.articles)
                }
            }
        }.resume()
    }
}
