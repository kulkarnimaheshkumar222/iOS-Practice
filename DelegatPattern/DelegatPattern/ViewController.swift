//
//  ViewController.swift
//  DelegatPattern
//
//  Created by Mahesh Kulkarni on 20/07/22.
//

import UIKit

class ViewController: UIViewController, CustomCellDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCustomTableViewCell()
    }
   
    
    func registerCustomTableViewCell() {
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.cellIdentifier)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()

        }
        cell.displayLbl.text = "\(indexPath.row)"
        cell.customCellDelegate = self
        cell.configure(index: indexPath.row)
        return cell
    }
    
    func didTapOnButton(index: Int) {
        print("Index is \(index)")
    }
    
    
}
