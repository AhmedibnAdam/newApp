//
//  LaunchViewController.swift
//  NewProject
//
//  Created by Adam on 1/21/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

public protocol ILaunchViewController: class {	
}

public class LaunchViewController: UIViewController {
	var presenter: ILaunchPresenter?

	override public func viewDidLoad() {
        super.viewDidLoad()
        // Do someting here...
    }
}

extension LaunchViewController: ILaunchViewController {
}

extension LaunchViewController {
}

extension LaunchViewController {
}
