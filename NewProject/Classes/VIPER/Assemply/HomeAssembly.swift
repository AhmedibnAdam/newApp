//
//  HomeAssembly.swift
//  NewProject
//
//  Created by Adam on 1/21/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject
import SwinjectAutoregistration

public class HomeAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container.register(HomeModule.self) { (_, appRouter: IAppRouter) in
            HomeModule(router: appRouter)
        }
        
        container.register(IHomeWireframe.self) { (_, appRouter: IAppRouter) -> IHomeWireframe in
            HomeWireframe(router: appRouter)
        }
        
        container.register(IHomeInteractor.self) { r in
            /*
             | Register your manager here, ex:
             |
             | let sampleManager = r.resolve(ISampleManager.self)!
             |
             | And let's initial the manager with interactor, ex:
             |
             | let interactor = HomeInteractor(sampleManager: sampleManager)
             */
            
           
            let loginManager =  r.resolve(ILoginManager.self)!
            
            let interactor = HomeInteractor(homeManager: loginManager)
            return interactor
        }
        
        container.register(IHomePresenter.self) { (r, appRouter: IAppRouter, view: IHomeViewController) in
            let wireframe = r.resolve(IHomeWireframe.self, argument: appRouter)!
            let interactor = r.resolve(IHomeInteractor.self)!
            let presenter = HomePresenter(interactor: interactor, wireframe: wireframe, view: view)
            interactor.delegate = presenter
            return presenter
        }
        
        /*
         | If you need passing some paramenter,
         | you can add new params with name parameters or other, ex:
         |
         | container.register(HomeViewController.self) { (r, appRouter: IAppRouter, parameters: [String: Any]) in
         |     let bundle = Bundle(for: HomeViewController.self)
         |     let view = HomeViewController(nibName: "HomeViewController", bundle: bundle)
         |     let presenter = r.resolve(IPresenter.self, arguments: appRouter, view as IHomeViewController)!
         |     presenter.parameters = parameters
         |     view.presenter = presenter
         |     return view
         | }
         */
        
        container.register(HomeViewController.self) { (r, appRouter: IAppRouter, parameters: [String: Any]) in
            let bundle = Bundle(for: HomeViewController.self)
            let view = HomeViewController(nibName: "HomeViewController", bundle: bundle)
            let presenter = r.resolve(IHomePresenter.self, arguments: appRouter, view as IHomeViewController)!
            presenter.parameters = parameters
            view.presenter = presenter
            return view
        }
    }
}
