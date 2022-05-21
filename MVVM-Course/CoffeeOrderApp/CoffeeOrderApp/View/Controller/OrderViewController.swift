//
//  OrderViewController.swift
//  CoffeeOrderApp
//
//  Created by Mahesh Kulkarni on 20/05/22.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var ordertblView: UITableView!
    
    var viewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getOrderList()
        registerOrderTableViewCell()
    }
    
    func registerOrderTableViewCell() {
        ordertblView.register(OrderTableViewCell.nib(), forCellReuseIdentifier: OrderTableViewCell.cellIdentifier)
    }
    
    func getOrderList() {
        
        WebService().load(resource: OrderModel.all) { result in
            switch result {
            case .success(let orders):
                self.viewModel.orderListViewModel = orders.map(OrderViewModel.init)
                DispatchQueue.main.async {
                    self.ordertblView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navContoller = segue.destination as? UINavigationController
        if let addOrderViewController = navContoller?.viewControllers.first as? AddOrderViewController {
            addOrderViewController.delegate = self
        }
    }
    
}

extension OrderViewController: UITableViewDataSource ,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.orderListViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.cellIdentifier, for: indexPath) as? OrderTableViewCell else {
            return UITableViewCell()
        }
        let resultViewModel = self.viewModel.orderViewModelAtIndex(indexPath.row)
        cell.configureCell(viewModel: resultViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension OrderViewController: AddCoffeeOrderDelegate {
    
    func addCoffeeOrderViewControllerDidSave(order: OrderModel, controller: UIViewController) {
        DispatchQueue.main.async {
            controller.dismiss(animated: true, completion: nil)
            self.viewModel.orderListViewModel.append(OrderViewModel(order: order))
            self.ordertblView.insertRows(at: [IndexPath.init(row: self.viewModel.orderListViewModel.count-1, section: 0)], with: .automatic)
        }
    }
    
    func addCoffeeOrderViewControllerDidclose(controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}



