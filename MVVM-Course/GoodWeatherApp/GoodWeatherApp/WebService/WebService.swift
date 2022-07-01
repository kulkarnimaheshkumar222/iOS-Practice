//
//  WebService.swift
//  GoodWeatherApp
//
//  Created by Mahesh Kulkarni on 07/06/22.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse:(Data)->T?
}

class WebService {
    
    func load<T>(resource: Resource<T>,completion: @escaping (T?)->()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, request, error in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(resource.parse(data))

        }.resume()
    }
}
