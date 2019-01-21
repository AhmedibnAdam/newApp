//
//  HomeModule.swift
//  PrmierLeague
//
//  Created by Adam on 1/17/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

public class HomeModule: IModule {
    public let router: IAppRouter

    public init(router: IAppRouter) {
        self.router = router
    }

    public func presentView(parameters: [String: Any], presentType: PresentType) {
        let wireframe = router.resolver.resolve(IHomeWireframe.self, argument: router)!
        wireframe.presentView(parameters: parameters, presentType: presentType)
    }
}
