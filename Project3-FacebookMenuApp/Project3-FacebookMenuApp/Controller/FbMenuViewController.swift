//
//  ViewController.swift
//  Project3-FacebookMenuApp
//
//  Created by Mahesh Kulkarni on 28/12/23.
//

import UIKit

class FbMenuViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    var viewModel = FbMenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCell()
        viewModel.configureCellTypes()
    }
    
    func registerCell() {
        menuTableView.register(MenuHeaderCell.nib(), forCellReuseIdentifier: MenuHeaderCell.cellIdentifier)
    }

}

extension FbMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowType = viewModel.getRowType(indexPath.row)
        
        switch rowType {
        case .menuHeaderCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuHeaderCell.cellIdentifier, for: indexPath) as? MenuHeaderCell else {
                return UITableViewCell()
            }
            return cell
        }
       
    }
}

