//
//  NewsListTableViewController.swift
//  GoodNewsApp
//
//  Created by Mahesh Kulkarni on 18/05/22.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    var articleListViewModel: ArticleListViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        callWebService()
    }
    
    func setUp() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "GoodNews"
    }
    
    func callWebService() {
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-04-18&sortBy=publishedAt&apiKey=f17a2be34ff0427a893c1a7b24693cc1")!
        WebService().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel?.numberOfRowsInSection(section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        let articleVM = self.articleListViewModel?.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM?.title
        cell.descriptionLabel.text = articleVM?.description
        
        return cell
    }

}

