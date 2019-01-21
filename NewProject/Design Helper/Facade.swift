//
//  Facade.swift
//  NewProject
//
//  Created by Adam on 1/21/19.
//  Copyright © 2019 Adam. All rights reserved.
//

import Foundation

/*
 *
        when you have big complex system
        devide it to subsystems
        When you need to hide the complexities of the system and
        provides an interface to the client
 
 *
 */


class SubSystem_1 {
    
    static func start() {
        print("start sub system 1 setup")
    }
}

class SubSystem_2 {
    static func start() {
        print("start sub system 2 setup")
    }
}

class SubSystem_3 {
    static func start() {
        print("start sub system 3 setup")
    }
}

class FacadeStartup {
    
    static func start() {
        SubSystem_1.start()
        SubSystem_2.start()
        SubSystem_3.start()
    }
}
