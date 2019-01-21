//
//  Observer.swift
//  NewProject
//
//  Created by Adam on 1/21/19.
//  Copyright © 2019 Adam. All rights reserved.
//

/*
 *
            When there is one-to-many relationship between objects
            such as if one object is modified, its depenedent objects
            are to be notified automatically
 *
 */


import Foundation

// main observer Methods or actions

protocol ApplyObservable {
    associatedtype T
    var value : T { get set }
    var observers : [Observer] { get set }
    
    func addObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyAllObservers<T>(with newValue: T)
}

// Observer
protocol Observer {
    var id : Int { get } // property to get an id
    func update<T>(with newValue: T)
}

class Variable<T> : ApplyObservable {
    
    private var _value : T! = nil
    private var _observers : [Observer] = []
    
    var value : T {
        get {
            return self._value
        }
        set {
            self._value = newValue
            self.notifyAllObservers(with: newValue)
        }
    }
    
    var observers : [Observer] {
        get {
            return self._observers
        }
        set {
            self._observers = newValue
        }
    }
    
    func addObserver(observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
        observers = observers.filter({$0.id != observer.id})
    }
    
    func notifyAllObservers<T>(with newValue: T) {
        for observer in observers {
            observer.update(with: newValue)
        }
    }
}



class Observer_Class_1 : Observer {
    
    private var _id : Int = 0
    
    var id: Int {
        get {
            return self._id
        }
    }
    
    init(id: Int) {
        self._id = id
    }
    
    func update<T>(with newValue: T) {
        print(" Observer #\(self.id) updated with new value : ", newValue)
    }
    
}

class Observer_Class_2: Observer {
    
    private var _id : Int = 0
    
    var id: Int {
        get {
            return self._id
        }
    }
    
    init(id: Int) {
        self._id = id
    }
    
    func update<T>(with newValue: T) {
        print(" Observer #\(self.id) updated with new value : ", newValue)
    }
}


class tester  {
    static func test() {
        var obs1 = Observer_Class_1(id: 1)
        var obs2 = Observer_Class_2(id: 2)
        var obsv = Variable<String>()
        obsv.addObserver(observer: obs1)
        obsv.addObserver(observer: obs2)
        obsv.value = "Hello world"
        obsv.removeObserver(observer: obs1)
        obsv.value = "Obs1 removed, yey"
    }
}
