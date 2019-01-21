//
//  LoginViewController.swift
//  PrmierLeague
//
//  Created by Adam on 1/17/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar


// consider the view with the xib file 

import UIKit

public protocol ILoginViewController: class {	
}

public class LoginViewController: UIViewController {
	var presenter: ILoginPresenter?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var user_name_textField: UITextField!
    @IBOutlet weak var password_textField: UITextField!
    
	override public func viewDidLoad() {
        super.viewDidLoad()
        // Do someting here...
    }
    @IBAction func loginAction(_ sender: UIButton) {
        let userName = user_name_textField.text ?? ""
        let password = password_textField.text ?? ""
        presenter?.handleLogin(user_name: userName, password: password)
    }
    
    
}

extension LoginViewController: ILoginViewController {
    
}

extension LoginViewController {
}

extension LoginViewController {
}
