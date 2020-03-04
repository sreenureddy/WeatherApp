//
//  WeatherTableViewCell.swift
//  DemoApp
//
//  Created by tmprf6 on 4/3/20.
//  Copyright © 2020 sreenu ramana. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var iconImgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func option(data: Weather.Forecast.ViewModel) {
        self.weatherLbl.text = data.descrption ?? ""
        self.speedLbl.text = data.speed ?? ""
        self.iconImgView.image = UIImage(named: "weather")
    }

}
