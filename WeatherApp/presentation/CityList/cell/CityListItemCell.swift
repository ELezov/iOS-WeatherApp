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
    
    static let id = "CityListItemCell"
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityCountryLabel: UILabel!
    
    override func configure(with model: CellViewModel) {
        guard let viewModel = model as? CityCellViewModel else {return}
        self.cityNameLabel.text = viewModel.cityName
        self.cityCountryLabel.text = viewModel.countryName
    }
}
