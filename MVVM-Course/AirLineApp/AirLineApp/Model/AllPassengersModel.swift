//
//  PassengersModel.swift
//  AirLineApp
//
//  Created by Mahesh Kulkarni on 27/06/22.
//

import Foundation

struct AllPassengersModel: Codable {
    var totalPassengers: Int
    var totalPages: Int
    var data: [PassengerModel]
    
    enum CodingKeys: String, CodingKey {
        case totalPassengers
        case totalPages
        case data
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.totalPassengers = try valueContainer.decode(Int.self, forKey: CodingKeys.totalPassengers)
        self.totalPages = try valueContainer.decode(Int.self, forKey: CodingKeys.totalPages)
        self.data = try valueContainer.decode([PassengerModel].self, forKey: CodingKeys.data)
    }
}

struct PassengerModel: Codable {
    var id: String
    var name: String
    var trips: Int
    var airline: [AirLineModel]
    var v: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case trips
        case airline
        case v = "__v"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try valueContainer.decode(String.self, forKey: CodingKeys.id)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        self.trips = try valueContainer.decode(Int.self, forKey: CodingKeys.trips)
        self.airline = try valueContainer.decode([AirLineModel].self, forKey: CodingKeys.airline)
        self.v = try valueContainer.decode(Int.self, forKey: CodingKeys.v)
    }
}

struct AirLineModel: Codable {
    var id: Int
    var name: String
    var country: String
    var logo: String
    var slogan: String
    var head_quaters: String
    var website: String
    var established: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case country
        case logo
        case slogan
        case head_quaters
        case website
        case established
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try valueContainer.decode(Int.self, forKey: CodingKeys.id)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        self.country = try valueContainer.decode(String.self, forKey: CodingKeys.country)
        self.logo = try valueContainer.decode(String.self, forKey: CodingKeys.logo)
        self.slogan = try valueContainer.decode(String.self, forKey: CodingKeys.slogan)
        self.head_quaters = try valueContainer.decode(String.self, forKey: CodingKeys.head_quaters)
        self.website = try valueContainer.decode(String.self, forKey: CodingKeys.website)
        self.established = try valueContainer.decode(String.self, forKey: CodingKeys.established)
    }
}
