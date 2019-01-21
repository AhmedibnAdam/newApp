//
//  HomeInteractor.swift
//  PrmierLeague
//
//  Created by Adam on 1/17/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

public protocol IHomeInteractorDelegate: class {
    func presentSuccess()
    func presentFail()
}

public protocol IHomeInteractor: class {
	var delegate: IHomeInteractorDelegate? { get set }
    func handlePrss ()
}

public class HomeInteractor: IHomeInteractor {

	// MARK: - Declare delegate

	public var delegate: IHomeInteractorDelegate?

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
    
    var homeManager: ILoginManager?
    
    init() {
        
    }

    init(homeManager : ILoginManager) {
        self.homeManager = homeManager
    }
    
    
    public func handlePrss() {
        
        print("ok ... ")
        homeManager?.doSomeThingElse(onSuccess: {
            print("1111111")
            self.delegate?.presentSuccess()
        }, onFail: {
            print("000000")
            self.delegate?.presentFail()
        })
    }
    
    
    
    
    

}
