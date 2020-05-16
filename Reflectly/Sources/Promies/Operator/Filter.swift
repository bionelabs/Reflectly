//
//  Filter.swift
//  VariableDemo
//
//  Created by Cao Phuoc Thanh on 5/16/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

extension Future where Value: Equatable {
    
    public func filer(_ condition: @escaping (Value) -> Bool) -> Future<Value> {
        let promise = Promise<Value>()
        observe { result in
            switch result {
            case .success(let value):
                if condition(value) {
                    promise.resolve(value)
                }
            case .failure(let error): promise.reject(error)
            }
        }
        return promise
    }
}
