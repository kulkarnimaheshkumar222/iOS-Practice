//
//  OrderViewModel.swift
//  CoffeeOrderApp
//
//  Created by Mahesh Kulkarni on 20/05/22.
//

import Foundation

class OrderListViewModel {
    var orderListViewModel: [OrderViewModel]
    init() {
        self.orderListViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    func orderViewModelAtIndex(_ index: Int) -> OrderViewModel {
        return self.orderListViewModel[index]
    }
}

struct OrderViewModel {
    let order: OrderModel
}

extension OrderViewModel {
    var name: String {
        return self.order.name
    }
    
    var email: String {
        return self.order.email
    }
    
    var type: String {
        return self.order.type.rawValue
    }
    
    var size: String {
        return self.order.size.rawValue
    }
}


