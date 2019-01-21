//
//  LaunchPresenter.swift
//  NewProject
//
//  Created by Adam on 1/21/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

public protocol ILaunchPresenter: class {
	var parameters: [String: Any]? { get set }
}

public class LaunchPresenter: ILaunchPresenter {
	
	var interactor: ILaunchInteractor?
	var wireframe: ILaunchWireframe?
	weak var view: ILaunchViewController?
	public var parameters: [String: Any]?
	
	public init(interactor: ILaunchInteractor, wireframe: ILaunchWireframe, view: ILaunchViewController) {
		self.interactor = interactor
		self.wireframe = wireframe
		self.view = view
	}
}

extension LaunchPresenter: ILaunchInteractorDelegate {
	
}
