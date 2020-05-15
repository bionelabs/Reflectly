//
//  Future+Then.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 5/13/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

extension Future {
    public func map<T>(_ closure: @escaping (Value) throws -> T
    ) -> Future<T> {
         return chained { value in
             try Promise(closure(value))
        }
    }
}
