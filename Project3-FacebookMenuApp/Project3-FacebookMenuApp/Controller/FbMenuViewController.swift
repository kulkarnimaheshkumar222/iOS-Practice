//
//  ViewController.swift
//  Project3-FacebookMenuApp
//
//  Created by Mahesh Kulkarni on 28/12/23.
//

import UIKit

class FbMenuViewController: UIViewController {
    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension FbMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "\(indexPath.row)"
        return cell ?? UITableViewCell()
    }
}

