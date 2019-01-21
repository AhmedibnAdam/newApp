//
//  LaunchWireframe.swift
//  NewProject
//
//  Created by Adam on 1/21/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

public protocol ILaunchWireframe: class {
    func presentView(parameters: [String: Any], presentType: PresentType)    
}

public class LaunchWireframe: ILaunchWireframe {
    let router: IAppRouter

    init(router: IAppRouter) {
        self.router = router
    }

    public func presentView(parameters: [String: Any], presentType: PresentType) {
        let view = router.resolver.resolve(LaunchViewController.self, arguments: router, parameters)!
        router.present(view: view, animatedDisplay: true, animatedDismiss: true, presentType: presentType)
    }
}
