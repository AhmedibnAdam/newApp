//
//  LoginInteractor.swift
//  PrmierLeague
//
//  Created by Adam on 1/17/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

// layer between the presenter and the manager

import UIKit

public protocol ILoginInteractorDelegate: class {
	func presentSuccess()
    func presentFail()
}

public protocol ILoginInteractor: class {
	var delegate: ILoginInteractorDelegate? { get set }
    func handleLogin (user_name:String , password:String)
    
}

public class LoginInteractor: ILoginInteractor {
    
	// MARK: - Declare delegate

	public var delegate: ILoginInteractorDelegate?

	/*
	 | Declare your managers here, ex:
	 |
	 | var sampleManager: ISampleManager?
	 |
	 | And let's initial managers, ex:
	 |
	 | init(sampleManager: ISampleManager) {
	 |    self.sampleManager = sampleManager
	 | }
	 */
    
     var loginManager: ILoginManager?
    init() {
        
    }

    init(loginManager: ILoginManager) {
            self.loginManager = loginManager
         }
    
    
    public func handleLogin(user_name: String, password: String) {
        loginManager?.processLogin(user_name: user_name, password: password, onSuccess: {
            self.delegate?.presentSuccess()
            
        }, onFail: {
            self.delegate?.presentFail()
        })
    }
}
