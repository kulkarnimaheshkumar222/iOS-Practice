//
//  AddOrderViewController.swift
//  CoffeeOrderApp
//
//  Created by Mahesh Kulkarni on 20/05/22.
//

import UIKit

protocol AddCoffeeOrderDelegate {
    func addCoffeeOrderViewControllerDidSave(order: OrderModel,controller: UIViewController)
    func addCoffeeOrderViewControllerDidclose(controller: UIViewController)
}

class AddOrderViewController: UIViewController {
    
    @IBOutlet weak var addOrdertblView: UITableView!
    
    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    var coffeeSizeSegmentedControl: UISegmentedControl!
    
    var viewModel = AddCoffeeOrderViewModel(name: nil, email: nil)
    
    var delegate: AddCoffeeOrderDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerAddOrderTableViewCell()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    func registerAddOrderTableViewCell() {
        addOrdertblView.register(OrderTableViewCell.nib(), forCellReuseIdentifier: OrderTableViewCell.cellIdentifier)
    }
    
    func setUpUI() {
        self.coffeeSizeSegmentedControl = UISegmentedControl(items: self.viewModel.sizes)
        self.coffeeSizeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(coffeeSizeSegmentedControl)
        self.coffeeSizeSegmentedControl.topAnchor.constraint(equalTo: self.addOrdertblView.bottomAnchor, constant: 20).isActive = true
        self.coffeeSizeSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.nameTxtField.topAnchor.constraint(equalTo: self.coffeeSizeSegmentedControl.bottomAnchor, constant: 20).isActive = true
        self.nameTxtField.leadingAnchor.constraint(equalTo: self.coffeeSizeSegmentedControl.leadingAnchor).isActive = true
        self.nameTxtField.trailingAnchor.constraint(equalTo: self.coffeeSizeSegmentedControl.trailingAnchor).isActive = true
        
        
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        if let delegate = delegate {
            delegate.addCoffeeOrderViewControllerDidclose(controller: self)
        }
    }
    

    @IBAction func saveBtnClicked(_ sender: Any) {
        
        let name = self.nameTxtField.text
        let email = self.emailTxtField.text
        var selectedSize:String?
        if (self.coffeeSizeSegmentedControl.selectedSegmentIndex >= 0 ){
        selectedSize = self.coffeeSizeSegmentedControl.titleForSegment(at: self.coffeeSizeSegmentedControl.selectedSegmentIndex)
        }
        guard let indexPath = self.addOrdertblView.indexPathForSelectedRow else {
            return
        }
        self.viewModel.name = name
        self.viewModel.email = email
        
        self.viewModel.selectedSize = selectedSize
        self.viewModel.selectedType = self.viewModel.types[indexPath.row]
        
        WebService().load(resource: OrderModel.create(viewModel: self.viewModel)) { result in
            switch result {
            case .success(let order):
                if let order = order ,let delegate = self.delegate {
                    delegate.addCoffeeOrderViewControllerDidSave(order: order, controller: self)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
    
}

extension AddOrderViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.cellIdentifier, for: indexPath) as? OrderTableViewCell else {
            return UITableViewCell()
        }
        let type = self.viewModel.types[indexPath.row]
        cell.ordertypeLbl.text = type
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
}
