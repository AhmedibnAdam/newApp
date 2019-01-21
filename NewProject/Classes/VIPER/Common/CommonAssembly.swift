//
//  CommonAssembly
//  PrmierLeague
//
//  Created by Adam on 1/17/19.
//  Copyright (c) 2019 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

public class CommonAssembly: Assembly {
	
	public func assemble(container: Container) {
		container.register(IAppRouter.self) { _ in
			AppRouter.shared
		}

		/*
		 | Register your manager here, ex :
         | }
        */
        container.register(ILoginManager.self) {_ in
		 	     LoginManager()
        }
 
	}
}
