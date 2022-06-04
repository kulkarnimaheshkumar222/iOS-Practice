//
//  WeatherTableViewCell.swift
//  GoodWeatherApp
//
//  Created by Mahesh Kulkarni on 04/06/22.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "WeatherTableViewCell"
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var cityTempLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "WeatherTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
