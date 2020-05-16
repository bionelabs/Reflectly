//
//  Future+Await.swift
//  Reflectly
//
//  Created by Cao Phuoc Thanh on 5/16/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import Foundation

public func await<T>(_ block: @escaping () -> Future<T>) throws -> T {
    let semophore = DispatchSemaphore(value: 0)
    let a = block()
    var value: T?
    var error: Error?
    a.observe { (re) in
        switch re {
        case .success(let v):
            value = v
        case .failure(let e):
            error = e
        }
        semophore.signal()
    }
    if let error = error {
        throw error
    }
    return value!
}

