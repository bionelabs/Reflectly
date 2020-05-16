//
//  Database.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 5/8/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit



class Database {
    
    static let `default` = Database()
    
    fileprivate var objects: [Object] = []
    
    func set(pool: String, object: Object) throws {
        let old = self.objects.filter { object._id.value == $0._id.value }.first
        if let _old = old {
            if  _old._pools.value.contains(pool) == false {
                _old._pools.value.append(pool)
            } else {
                throw NSError(domain: "set", code: 0, userInfo: ["DSSDSD": "SFSFSF"])
            }
        } else {
            object._pools.value.append(pool)
            self.objects.append(object)
        }
    }
    
    func get<T: Object>(id: String) -> T? {
        return self.objects.filter { id == $0._id.value}.first as? T
    }
    
    func remove(id: String) {
        self.objects.removeAll { (ob) -> Bool in
            ob._id.value == id
        }
    }
    
    func remove(id: String, pool: String) {
        let object = self.get(id: id)
        object?._pools.value.removeAll(where: { $0 == pool})
    }
    
    func fetch(pool: String) -> Genenic<[Object]> {
        let object = self.objects.filter { $0._pools.value.contains(pool)}
        return Genenic<[Object]>(object)
    }
}

