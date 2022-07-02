//
//  ViewController.swift
//  AirLineApp
//
//  Created by Mahesh Kulkarni on 27/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var airLinetblView: UITableView!
    var currentPageNo = 0
    var viewModel = AllPassengerViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "AirLine List"
        registerPassengerTableViewCell()
        viewModel.getAllPassengers(pageNo: currentPageNo,pagination: false) { [weak self] result in
            switch result {
            case .success(let response):
                self?.viewModel.passengerModelArray.append(contentsOf: response)
                DispatchQueue.main.async {
                self?.airLinetblView.reloadData()
                }
            case .failure(_):
                break
            }
        }
    }
    
    func registerPassengerTableViewCell() {
        airLinetblView.register(PassengerTableViewCell.nib(), forCellReuseIdentifier: PassengerTableViewCell.cellIdentifier)
    }
    
    func createSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
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

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // calculates where the user is in the y-axis
        let offsetY = scrollView.contentOffset.y
        let contentHeight = airLinetblView.contentSize.height
        
        if offsetY > (contentHeight - 100 - scrollView.frame.size.height) {
            print("fetch more")
            guard !viewModel.isPagination else {
                return
            }
            self.airLinetblView.tableFooterView = createSpinnerFooter()
            currentPageNo += 1
            viewModel.getAllPassengers(pageNo: currentPageNo, pagination: true) { [weak self]  result in
                DispatchQueue.main.async {
                    self?.airLinetblView.tableFooterView = nil
                }
                switch result {
                case .success(let response):
                    self?.viewModel.passengerModelArray.append(contentsOf: response)
                    DispatchQueue.main.async {
                        self?.airLinetblView.reloadData()
                    }
                case .failure(_):
                    break
                }
            }
        }
    }

}

