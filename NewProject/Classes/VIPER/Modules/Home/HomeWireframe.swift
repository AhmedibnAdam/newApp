//
//  HomeWireframe.swift
//  PrmierLeague
//
//  Created by Adam on 1/17/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

public protocol IHomeWireframe: class {
    func presentView(parameters: [String: Any], presentType: PresentType)
    func navigateToLaunch()
}

public class HomeWireframe: IHomeWireframe {
    public func navigateToLaunch() {
        AppRouter.shared.presentModule(module: Products.ARTDEV.LaunchModule
            , parameters: [:], presentType: PresentType.push)
    }
    
    let router: IAppRouter

    init(router: IAppRouter) {
        self.router = router
    }

    public func presentView(parameters: [String: Any], presentType: PresentType) {
        let view = router.resolver.resolve(HomeViewController.self, arguments: router, parameters)!
        router.present(view: view, animatedDisplay: true, animatedDismiss: true, presentType: presentType)
    }
}
