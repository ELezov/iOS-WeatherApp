//
//  CityListSearchBarExtension.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit


extension CityListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 1 {
            guard let presentationModel = self.presentationModel as? CityListPresentationModel else {return}
            
            presentationModel.queryString = searchText
            presentationModel.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let presentationModel = self.presentationModel as? CityListPresentationModel else {return}
        presentationModel.reloadData()
    }
}
