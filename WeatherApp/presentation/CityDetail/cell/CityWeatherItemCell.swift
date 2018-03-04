//
//  CityWeatherItemCell.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class CityWeatherItemCell : UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
//    override func configure(with model: CellViewModel) {
//        guard let viewModel = model as? CityWeatherCellViewModel else {return}
//        self.reset()
//        self.dateLabel.text = viewModel.dateString
//        self.descriptionLabel.text = viewModel.weatherDescription
//        if let icon = viewModel.icon {
//            let stringUrlIcon = Constants.OpenWeather.Icon.url + icon + ".png"
//            self.iconView.kf.setImage(with: URL(string: stringUrlIcon))
//        }
//        if let temp = viewModel.temp {
//            self.tempLabel.text = "\(temp) °C"
//        }
//        
//    }
    override func awakeFromNib() {
        self.selectionStyle = UITableViewCellSelectionStyle.none;
    }
    
    func reset(){
        self.dateLabel.text = ""
        self.descriptionLabel.text = ""
        self.tempLabel.text = ""
    }
}
