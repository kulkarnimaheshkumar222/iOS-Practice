//
//  PassengerTableViewCell.swift
//  AirLineApp
//
//  Created by Mahesh Kulkarni on 30/06/22.
//

import UIKit
import SDWebImage

class PassengerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var airlineLogoImg: UIImageView!
    @IBOutlet weak var airLineNameLbl: UILabel!
    @IBOutlet weak var airLineSloganLbl: UILabel!
    @IBOutlet weak var airLineHeadQuatersLbl: UILabel!
    
    static let cellIdentifier = "PassengerTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.airlineLogoImg.addCircularBordertoImg()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PassengerTableViewCell", bundle: nil)
    }
    
    func configureAirLineData(model: AirLineModel) {
        self.airLineNameLbl.text = model.name
        self.airLineSloganLbl.text = model.slogan
        self.airLineHeadQuatersLbl.text = model.head_quaters
        self.airlineLogoImg.sd_setImage(with: URL(string: model.logo), placeholderImage:  UIImage(named: "placeholder.png"))
    }
    
}
