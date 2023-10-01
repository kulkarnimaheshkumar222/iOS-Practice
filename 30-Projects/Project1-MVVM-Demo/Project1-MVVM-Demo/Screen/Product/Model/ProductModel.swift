//
//  ProductModel.swift
//  Project1-MVVM-Demo
//
//  Created by Mahesh Kulkarni on 24/09/23.
//

import Foundation

// MARK: - ProductModel

struct ProductModel: Codable, Hashable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: Category?
    let image: String?
    let rating: Rating?
    var identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    private enum CodingKeys: String, CodingKey {
        case id, title, price, description, category, image, rating
    }
}

// MARK: - Category

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating

struct Rating: Codable {
    let rate: Double?
    let count: Int?
}
