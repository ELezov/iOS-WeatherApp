//
//  CityDetailViewController.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit

class CityDetailViewController: ViewController {
    
    static let id = "CityDetailViewController"
    
    var viewModel = CityDetailViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        presentationModel = CityDetailPresentationModel(presenter: self)
    }

    
    func initTableView(){
        let nib = UINib(nibName: CityWeatherItemCell.id, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CityWeatherItemCell.id)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = refreshControl
    }
    
    override func reloadData() {
        super.reloadData()
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
}
