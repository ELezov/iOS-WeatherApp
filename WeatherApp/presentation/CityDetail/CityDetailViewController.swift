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
    var presentionModel: CityDetailPresentationModel?
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        presentionModel = CityDetailPresentationModel(presenter: self)
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        presentionModel?.reloadData()
    }
    
    func initTableView(){
        let nib = UINib(nibName: CityWeatherItemCell.id, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CityWeatherItemCell.id)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
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
