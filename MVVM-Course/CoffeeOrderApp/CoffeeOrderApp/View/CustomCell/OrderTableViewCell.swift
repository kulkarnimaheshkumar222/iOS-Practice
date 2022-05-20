//
//  OrderTableViewCell.swift
//  CoffeeOrderApp
//
//  Created by Mahesh Kulkarni on 20/05/22.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ordertypeLbl: UILabel!
    @IBOutlet weak var ordersizeLbl: UILabel!
    static let cellIdentifier = "OrderTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "OrderTableViewCell", bundle: nil)
    }
    
    func configureCell(viewModel: OrderViewModel) {
        self.ordertypeLbl.text = viewModel.type
        self.ordersizeLbl.text = viewModel.size
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

