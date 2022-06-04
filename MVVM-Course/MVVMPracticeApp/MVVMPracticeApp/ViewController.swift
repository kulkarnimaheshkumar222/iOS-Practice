//
//  ViewController.swift
//  MVVMPracticeApp
//
//  Created by Mahesh Kulkarni on 28/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = PassengerViewModel()
    var pageNumber = 0
    
    var passengerDetailData:[PassengerDetailModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "MVVM Demo"
        registerTableViewCell()
        getData()
    }
    
    func getData() {
        viewModel.getpassengerData(pageNumber:pageNumber) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
       
       
    }
    
    func registerTableViewCell() {
        tableView.register(PassengerTableViewCell.nib(), forCellReuseIdentifier: PassengerTableViewCell.CellIdentifier)
    }
    
}

extension ViewController: UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PassengerTableViewCell.CellIdentifier, for: indexPath) as? PassengerTableViewCell else {
           return UITableViewCell()
        }
        cell.airlineName.text = self.viewModel.passengerDetailModelArray?[indexPath.row].airline[0].name
        cell.airlineHeadQuarter.text = self.viewModel.passengerDetailModelArray?[indexPath.row].airline[0].headQuaters
        return cell
    }
    
   
    
     func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height

            if offsetY > contentHeight - scrollView.frame.size.height {
                   pageNumber += 1
                viewModel.getpassengerData(pageNumber:pageNumber) {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }

        }
}
