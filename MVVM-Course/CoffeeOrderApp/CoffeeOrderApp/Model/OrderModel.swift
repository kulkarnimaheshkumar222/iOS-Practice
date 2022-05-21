//
//  OrderModel.swift
//  CoffeeOrderApp
//
//  Created by Mahesh Kulkarni on 20/05/22.
//

import Foundation

struct OrderModel: Codable {
    let name:String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
    
}
enum CoffeeType:String,Codable,CaseIterable {
    case Latte
    case Cappuccino
    case Cortado
    case Americano
    case Robusta
    case Arabica
}
enum CoffeeSize:String,Codable,CaseIterable {
    case small
    case medium
    case large
}

extension OrderModel {
    init?(_ viewModel: AddCoffeeOrderViewModel) {
        guard let name = viewModel.name,
              let email = viewModel.email,
              let selectedType = CoffeeType(rawValue: viewModel.selectedType ?? ""),
              let selectedSize = CoffeeSize(rawValue: viewModel.selectedSize ?? "") else {
            return nil
        }
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}
extension OrderModel {

    static func create(viewModel: AddCoffeeOrderViewModel) -> Resource<OrderModel?> {
        
        let order = OrderModel(viewModel)
        
        guard let url = URL(string: Constant.orderListUrlStr) else {
            fatalError("Error")
        }
        guard let data = try? JSONEncoder().encode(order)  else {
            fatalError("Error")
        }
        
        var resource = Resource<OrderModel?>(url: url)
        resource.httpMethod = .post
        resource.body = data
        return resource
        
        
    }
}

extension OrderModel {
    static var all: Resource<[OrderModel]> =  {
        guard let url = URL(string: Constant.orderListUrlStr) else {
            fatalError("Error")
        }
        return Resource<[OrderModel]>(url: url)
    }()
}
