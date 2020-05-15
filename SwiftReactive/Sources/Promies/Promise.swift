//
//  Promies.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 5/13/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public class Promise<Value>: Future<Value> {
    
    public required init(_ value: Value? = nil) {
        super.init()
        result = value.map(Result.success)
    }
    
    public func resolve(_ value: Value) {
        result = .success(value)
    }
    
    public func reject(_ error: Error) {
        result = .failure(error)
    }
}

extension Promise {
    public static func just(_ value: Value) -> Promise<Value> {
        return Promise<Value>(value)
    }
}


