//
//  Promies.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 5/13/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public class Promise<Value>: Future<Value> {
    
    public init(value: Value? = nil) {
        super.init()
        result = value.map(Result.success)
    }
    
    public func resolve(with value: Value) {
        result = .success(value)
    }
    
    public func reject(with error: Error) {
        result = .failure(error)
    }
}


