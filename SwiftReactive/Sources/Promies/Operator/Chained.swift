//
//  Future+Chaind.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 5/13/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

extension Future {
    
    internal func chained<T>(_ closure: @escaping (Value) throws -> Future<T>) -> Future<T> {
        let promise = Promise<T>()
        observe { result in
            switch result {
            case .success(let value):
                do {
                    let future = try closure(value)
                    future.observe { result in
                        switch result {
                        case .success(let value):
                            promise.resolve(value)
                        case .failure(let error):
                            promise.reject(error)
                        }
                    }
                } catch {
                    promise.reject(error)
                }
            case .failure(let error):
                promise.reject(error)
            }
        }
        
        return promise
    }
}


