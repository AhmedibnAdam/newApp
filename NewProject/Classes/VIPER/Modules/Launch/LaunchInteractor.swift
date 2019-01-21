//
//  LaunchInteractor.swift
//  NewProject
//
//  Created by Adam on 1/21/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

public protocol ILaunchInteractorDelegate: class {
	
}

public protocol ILaunchInteractor: class {
	var delegate: ILaunchInteractorDelegate? { get set }
}

public class LaunchInteractor: ILaunchInteractor {
	
	// MARK: - Declare delegate

	public var delegate: ILaunchInteractorDelegate?

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

	init() {
		// Do someting here...
	}
}