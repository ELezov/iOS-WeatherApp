//
//  CityListItemCell.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit

class CityListItemCell: TableCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityCountryLabel: UILabel!
    
//    override func configure(with model: CellViewModel) {
//        guard let viewModel = model as? CityCellViewModel else {return}
//        if viewModel.fullName != nil {
//            cityNameLabel.text = viewModel.fullName
//        } else if let nameCity = viewModel.cityName {
//            cityNameLabel.text = nameCity
//        }
//
//        if let countyName = viewModel.countryName {
//            self.cityCountryLabel.text = countyName
//        }
//    }
    
    override func awakeFromNib() {
        self.selectionStyle = UITableViewCellSelectionStyle.none;
    }
}
