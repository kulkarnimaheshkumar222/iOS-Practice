//
//  CustomTableViewCell.swift
//  DelegatPattern
//
//  Created by Mahesh Kulkarni on 20/07/22.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didTapOnButton(index: Int)
}

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var displayLbl: UILabel!
    @IBOutlet weak var actionBtn: UIButton!
    
    var index: Int = 0
    
    weak var customCellDelegate: CustomCellDelegate?
    
    static let cellIdentifier = "CustomTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        actionBtn.addTarget(self, action: #selector(didTapOnButton(index:)), for: .touchUpInside)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func didTapOnButton(index: Int) {
        customCellDelegate?.didTapOnButton(index: self.index)
    }
    
     func configure(index: Int) {
         self.index = index
    }
}
