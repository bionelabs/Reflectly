//
//  Event.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 5/12/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

public class Future<Value> {
    
    typealias Result = Swift.Result<Value, Error>
    
    internal var result: Result? {
        didSet { result.map(onChange) }
    }
    
    private var callbacks = [(Result) -> Void]()
    
    func observe(using callback: @escaping (Result) -> Void) {
        if let result = result {
            return callback(result)
        }
        callbacks.append(callback)
    }
    
    private func onChange(result: Result) {
        callbacks.forEach { $0(result) }
    }
}
