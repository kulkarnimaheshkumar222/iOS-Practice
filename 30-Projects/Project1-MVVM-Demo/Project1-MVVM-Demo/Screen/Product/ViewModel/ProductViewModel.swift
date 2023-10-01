//
//  ProductViewModel.swift
//  Project1-MVVM-Demo
//
//  Created by Mahesh Kulkarni on 24/09/23.
//

import Foundation

final class ProductViewModel {
    
    var product = [ProductModel]()
    var productCellModel = [ProductCollectionViewCellModel]()
    var eventHandler: ((Event) -> Void)?
    func fetchProduct(successCompletion: (()->Void)?) {
        self.eventHandler?(.loading)
        APIManager.shared.fetchProduct { [weak self] response in
            self?.eventHandler?(.stopLoading)
            switch response {
            case .success(let product):
                self?.product = product
                self?.configureCellModel()
                self?.eventHandler?(.dataloaded)
                successCompletion?()
            case .failure(let error):
                self?.eventHandler?(.error(error))
                print(error)
            }
        }
    }
    
    func configureCellModel() {
        for product in self.product {
            let model = ProductCollectionViewCellModel(model: product)
            self.productCellModel.append(model)
        }
    }
}

extension ProductViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataloaded
        case error(Error?)
    }
}
