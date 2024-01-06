//
//  MenuHeaderCell.swift
//  Project3-FacebookMenuApp
//
//  Created by Mahesh Kulkarni on 06/01/24.
//

import UIKit

class MenuHeaderCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var menuHeaderLbl: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    static let cellIdentifier = "MenuHeaderCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MenuHeaderCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setUI() {
        containerView.backgroundColor = .clear
        menuHeaderLbl.textColor = .black
        menuHeaderLbl.text = "Menu"
        menuHeaderLbl.font = .preferredFont(forTextStyle: .extraLargeTitle2)
    }
    
}
