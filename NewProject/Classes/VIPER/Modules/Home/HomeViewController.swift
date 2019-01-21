//
//  HomeViewController.swift
//  PrmierLeague
//
//  Created by Adam on 1/17/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

public protocol IHomeViewController: class {	
}

public class HomeViewController: UIViewController {
	var presenter: IHomePresenter?

	override public func viewDidLoad() {
        super.viewDidLoad()
        // Do someting here...
    }
    
    @IBAction func handleNav(_ sender: UIButton) {
        presenter?.handleNave()
    }
    
}

extension HomeViewController: IHomeViewController {
}

extension HomeViewController {
}

extension HomeViewController {
}
