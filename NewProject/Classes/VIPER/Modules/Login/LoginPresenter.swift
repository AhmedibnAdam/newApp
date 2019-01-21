//
//  LoginPresenter.swift
//  PrmierLeague
//
//  Created by Adam on 1/17/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

// the presenter wutch takes data from interactor and present it to view

import UIKit

public protocol ILoginPresenter: class {
	var parameters: [String: Any]? { get set }
    func handleLogin (user_name:String , password:String)
}

public class LoginPresenter: ILoginPresenter {

	var interactor: ILoginInteractor?
	var wireframe: ILoginWireframe?
	weak var view: ILoginViewController?
	public var parameters: [String: Any]?
	
	public init(interactor: ILoginInteractor, wireframe: ILoginWireframe, view: ILoginViewController) {
		self.interactor = interactor
		self.wireframe = wireframe
		self.view = view
	}
    public func handleLogin(user_name: String, password: String) {
        interactor?.handleLogin(user_name: user_name, password: password)
    }
}

extension LoginPresenter: ILoginInteractorDelegate {
    public func presentSuccess() {
        print("Success")
        wireframe?.navigateToHome()
    }
    
    public func presentFail() {
        print("Fail")
    }
    
	
}
