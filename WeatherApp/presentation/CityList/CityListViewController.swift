//
//  CityListViewController.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class CityListViewController: ViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel = CityListViewModel()
    var presentationModel: CityListPresentationModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        initSearchBar()
        presentationModel = CityListPresentationModel(presenter: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false;
    }
    
    
    func initTableView(){
        let nib = UINib(nibName: CityListItemCell.id, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CityListItemCell.id)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func initSearchBar(){
        searchBar.delegate = self
    }
    
    override func reloadData() {
        super.reloadData()
        tableView.reloadData()
    }

}

