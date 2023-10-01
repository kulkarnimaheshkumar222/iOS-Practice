//
//  APIManager.swift
//  Project1-MVVM-Demo
//
//  Created by Mahesh Kulkarni on 24/09/23.
//

import Foundation

final class APIManager {
    private init() { }
    static let shared = APIManager()
    
    func fetchProduct(completion: @escaping (Result<[ProductModel], DataError>) -> Void) {
        guard let url = URL(string: Constant.API.productUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let product =  try JSONDecoder().decode([ProductModel].self, from: data)
                completion(.success(product))
            } catch(let error) {
                completion(.failure(.network(error)))
            }
        }
        .resume()
    }
    
}

