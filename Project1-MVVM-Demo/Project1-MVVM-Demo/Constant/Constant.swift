//
//  Constant.swift
//  Project1-MVVM-Demo
//
//  Created by Mahesh Kulkarni on 24/09/23.
//

import Foundation
import UIKit
import Kingfisher

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

enum Constant {
    enum API {
        static let productUrl = "https://fakestoreapi.com/products"
    }
}

extension UIImageView {
    func setImage(string: String) {
       guard let url = URL(string: string) else { return }
        let resource = ImageResource(downloadURL: url, cacheKey: string)
        self.kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
