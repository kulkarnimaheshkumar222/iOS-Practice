//
//  PassengerTableViewCell.swift
//  MVVMPracticeApp
//
//  Created by Mahesh Kulkarni on 28/05/22.
//

import UIKit

class PassengerTableViewCell: UITableViewCell {

    @IBOutlet weak var airlineName: UILabel!
    
    @IBOutlet weak var airlineHeadQuarter: UILabel!
    
    static let CellIdentifier = "PassengerTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PassengerTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
