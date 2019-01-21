//
//  LaunchModule.swift
//  NewProject
//
//  Created by Adam on 1/21/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

public class LaunchModule: IModule {
    public let router: IAppRouter

    public init(router: IAppRouter) {
        self.router = router
    }

    public func presentView(parameters: [String: Any], presentType: PresentType) {
        let wireframe = router.resolver.resolve(ILaunchWireframe.self, argument: router)!
        wireframe.presentView(parameters: parameters, presentType: presentType)
    }
}
