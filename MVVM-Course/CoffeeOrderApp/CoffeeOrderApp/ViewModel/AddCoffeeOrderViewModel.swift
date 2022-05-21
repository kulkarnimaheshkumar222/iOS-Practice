//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrderApp
//
//  Created by Mahesh Kulkarni on 21/05/22.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var email: String?
    var selectedSize: String?
    var selectedType: String?
    var types:[String] {
        return CoffeeType.allCases.map{$0.rawValue}
    }
    var sizes:[String] {
        return CoffeeSize.allCases.map{$0.rawValue}
    }
}
