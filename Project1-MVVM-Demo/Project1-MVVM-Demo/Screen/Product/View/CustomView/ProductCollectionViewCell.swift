//
//  ProductCollectionViewCell.swift
//  Project1-MVVM-Demo
//
//  Created by Mahesh Kulkarni on 24/09/23.
//

import UIKit
import Kingfisher

class ProductCollectionViewCellModel: Hashable {
    
    var productModel: ProductModel?
    var identifier = UUID()
    
    init(model: ProductModel) {
        self.productModel = model
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: ProductCollectionViewCellModel, rhs: ProductCollectionViewCellModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}


class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    var viewModel: ProductCollectionViewCellModel? {
        didSet {
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }
    
    func setUI() {
        productImg.clipsToBounds = true
        productImg.contentMode = .scaleAspectFit
    }
    
    func configureCell() {
        self.titleLbl.text = self.viewModel?.productModel?.title ?? ""
        self.categoryLbl.text = self.viewModel?.productModel?.category?.rawValue ?? ""
        self.descriptionLbl.text = self.viewModel?.productModel?.description ?? ""
        self.priceLbl.text = "\(self.viewModel?.productModel?.price ?? 0.0)"
        let rating = "\(self.viewModel?.productModel?.rating?.rate ?? 0.0)"
        self.rateButton.setTitle(rating, for: .normal)
        productImg.setImage(string: self.viewModel?.productModel?.image ?? "")
        self.layoutIfNeeded()
    }

}
