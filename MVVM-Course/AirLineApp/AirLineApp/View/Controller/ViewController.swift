//
//  ViewController.swift
//  AirLineApp
//
//  Created by Mahesh Kulkarni on 27/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var airLinetblView: UITableView!
    
    var viewModel = AllPassengerViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "AirLine List"
        viewModel.viewController = self
        registerPassengerTableViewCell()
        viewModel.getAllPassengers(pageNo: viewModel.currentPageNo, pageSize: Constant.pageSize)
    }
    
    func registerPassengerTableViewCell() {
        airLinetblView.register(PassengerTableViewCell.nib(), forCellReuseIdentifier: PassengerTableViewCell.cellIdentifier)
    }
    
    
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PassengerTableViewCell.cellIdentifier, for: indexPath) as? PassengerTableViewCell else {
            return UITableViewCell()
        }
        let airLine = viewModel.getAirLineModel(index: indexPath.row)
        cell.configureAirLineData(model: airLine)
        return cell
    }
}

