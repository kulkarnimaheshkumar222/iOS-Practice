//
//  ArticleModel.swift
//  GoodNewsApp
//
//  Created by Mahesh Kulkarni on 18/05/22.
//

import Foundation

struct ArticleListModel: Decodable {
    let status: String
    let totalResults:Int
    let articles: [ArticleModel]
}

struct ArticleModel: Decodable {
    let source:ArticleSourceModel
    let author:String?
    let title: String
    let description:String
}

struct ArticleSourceModel: Decodable {
    let id:String?
    let name: String
}


