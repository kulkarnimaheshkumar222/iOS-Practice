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
enum CoffeeType:String,Codable {
    case Latte
    case Cappuccino
    case Cortado
    case Americano
    case Robusta
    case Arabica
}
enum CoffeeSize:String,Codable {
    case small
    case medium
    case large
}
