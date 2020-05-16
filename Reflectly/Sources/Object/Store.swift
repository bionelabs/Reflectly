//
//  Store.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 6/30/16.
//  Copyright © 2016 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

/* Store */
class Store {
    
    static var `default` = Store()
    
    private var store = [Pool]()
    
    func getStore() -> [Pool] {
        return self.store
    }
    
    func removeReaction(sender: AnyObject) {
        //print("TODO: Please release reaction of sender: ", sender.absoluteURL ?? "")
    }
    
    func add(_ object: Object, to pool: String) {
        if self.store.count > 0 {
            for value in self.store {
                if value.model._id.value == object._id.value
                    && "\(String(describing: value.model.self))" == "\(String(describing: object.self))" {
                    value.model = object
                    if !value.indentifiers.contains(pool) {
                        value.indentifiers.append(pool)
                    }
                    return
                }
            }
        }
        let newStore = Pool(object, pool: pool)
        self.store.append(newStore)
    }
    
    func remove(object: Object, pool: String) {
        for (index, value) in self.store.enumerated() {
            if value.model._id.value == object._id.value
                && "\(String(describing: value.model.self))" == "\(object.self)" {
                self.store.remove(at: index)
            } else {
                print("model with identifer \(object._id) not exits.")
            }
        }
    }
    
    func fetch(pool: String) -> [Pool] {
        var arr = [Pool]()
        for value in self.store {
            for _pool in value.indentifiers {
                if _pool == pool {
                    arr.append(value)
                }
            }
        }
        return arr
    }
    
}
