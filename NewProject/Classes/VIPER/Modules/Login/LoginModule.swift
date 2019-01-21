//
//  LoginModule.swift
//  PrmierLeague
//
//  Created by Adam on 1/17/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

// the creation of the module 

import Foundation
import UIKit

public class LoginModule: IModule {
    public let router: IAppRouter

    public init(router: IAppRouter) {
        self.router = router
    }

    public func presentView(parameters: [String: Any], presentType: PresentType) {
        let wireframe = router.resolver.resolve(ILoginWireframe.self, argument: router)!
        wireframe.presentView(parameters: parameters, presentType: presentType)
    }
}
