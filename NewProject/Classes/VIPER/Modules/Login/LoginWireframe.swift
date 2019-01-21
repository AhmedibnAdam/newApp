//
//  LoginWireframe.swift
//  PrmierLeague
//
//  Created by Adam on 1/17/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar


// navigation between modules    routing

import UIKit

public protocol ILoginWireframe: class {
    func presentView(parameters: [String: Any], presentType: PresentType)
    func navigateToHome()
}

public class LoginWireframe: ILoginWireframe {
    
    let router: IAppRouter

    init(router: IAppRouter) {
        self.router = router
    }

    public func presentView(parameters: [String: Any], presentType: PresentType) {
        let view = router.resolver.resolve(LoginViewController.self, arguments: router, parameters)!
        router.present(view: view, animatedDisplay: true, animatedDismiss: true, presentType: presentType)
    }
    public func navigateToHome() {
        AppRouter.shared.presentModule(module: Products.ARTDEV.HomeModule
            , parameters: [:], presentType: PresentType.push)
    }
}
