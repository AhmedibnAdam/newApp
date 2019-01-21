//
//  AppRouter.swift
//  PrmierLeague
//
//  Created by Adam on 1/17/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

 class AppRouter{
    public static let shared = AppRouter.createAppRouter()
    public static var assembler = Assembler()
    public static var products: [String: (_ appRouter: IAppRouter) -> IProductRouter] = [:]

    private static func createAppRouter() -> AppRouter {
        let router = AppRouter(assembler: assembler, products: products)
        return router
    }
}
