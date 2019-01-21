//
//  LaunchAssembly.swift
//  NewProject
//
//  Created by Adam on 1/21/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

public class LaunchAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container.register(LaunchModule.self) { (_, appRouter: IAppRouter) in
            LaunchModule(router: appRouter)
        }
        
        container.register(ILaunchWireframe.self) { (_, appRouter: IAppRouter) -> ILaunchWireframe in
            LaunchWireframe(router: appRouter)
        }
        
        container.register(ILaunchInteractor.self) { _ in
            
            /*
             | Register your manager here, ex:
             |
             | let sampleManager = r.resolve(ISampleManager.self)!
             |
             | And let's initial the manager with interactor, ex:
             |
             | let interactor = LaunchInteractor(sampleManager: sampleManager)
             */
            
            let interactor = LaunchInteractor()
            return interactor
        }
        
        container.register(ILaunchPresenter.self) { (r, appRouter: IAppRouter, view: ILaunchViewController) in
            let wireframe = r.resolve(ILaunchWireframe.self, argument: appRouter)!
            let interactor = r.resolve(ILaunchInteractor.self)!
            let presenter = LaunchPresenter(interactor: interactor, wireframe: wireframe, view: view)
            interactor.delegate = presenter
            return presenter
        }
        
        /*
         | If you need passing some paramenter,
         | you can add new params with name parameters or other, ex:
         |
         | container.register(LaunchViewController.self) { (r, appRouter: IAppRouter, parameters: [String: Any]) in
         |     let bundle = Bundle(for: LaunchViewController.self)
         |     let view = LaunchViewController(nibName: "LaunchViewController", bundle: bundle)
         |     let presenter = r.resolve(IPresenter.self, arguments: appRouter, view as ILaunchViewController)!
         |     presenter.parameters = parameters
         |     view.presenter = presenter
         |     return view
         | }
         */
        
        container.register(LaunchViewController.self) { (r, appRouter: IAppRouter, parameters: [String: Any]) in
            let bundle = Bundle(for: LaunchViewController.self)
            let view = LaunchViewController(nibName: "LaunchViewController", bundle: bundle)
            let presenter = r.resolve(ILaunchPresenter.self, arguments: appRouter, view as ILaunchViewController)!
            presenter.parameters = parameters
            view.presenter = presenter
            return view
        }
    }
}