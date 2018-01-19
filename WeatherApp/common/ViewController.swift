//
//  ViewController.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var errorScreenView: ErrorScreenView? = {
        let view: ErrorScreenView = UIView.fromNib()
        view.configure(
            title: "Упс! Что-то пошло не так",
            message: "Пожалуйста, попробуйте еще раз.",
            image: #imageLiteral(resourceName: "imgSmthWrong"))
        return view
    }()
    
    lazy var zeroScreenView: ErrorScreenView? = {
        let view: ErrorScreenView = UIView.fromNib()
        view.configure(
            title: "Ничего не найдено",
            message: "Пока мы умеем искать только\nпо названию заведения",
            image: #imageLiteral(resourceName: "imgNotFound"))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reloadData(){
        
    }

}

