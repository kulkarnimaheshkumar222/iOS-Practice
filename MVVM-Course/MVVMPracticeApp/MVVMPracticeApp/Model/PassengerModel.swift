//
//  PassengerModel.swift
//  MVVMPracticeApp
//
//  Created by Mahesh Kulkarni on 28/05/22.
//

import Foundation

struct PassengerModel:Codable {
    
    var totalPassengers: Int
    var totalPages: Int
    var data: [PassengerDetailModel]
    
    enum CodingKeys: String,CodingKey {
        case totalPassengers
        case totalPages
        case data
    }
}

struct PassengerDetailModel: Codable {
    var id: String
    var name: String
    var trips: Int
    var airline: [AirlineDetailModel]
    var v: Int
    
    enum CodingKeys: String,CodingKey {
        case id = "_id"
        case name
        case trips
        case airline
        case v = "__v"
    }
}

struct AirlineDetailModel:Codable {
    var id: Int
    var name: String
    var country: String
    var logo: String
    var slogan: String
    var headQuaters: String
    var website: String
    var established: String
    
    enum CodingKeys: String,CodingKey {
        case id
        case name
        case country
        case logo
        case slogan
        case headQuaters =  "head_quaters"
        case website
        case established
    }
    
}
