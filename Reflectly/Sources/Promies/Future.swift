//
//  Event.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 5/12/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

public class Future<Value> {

    public typealias Event = Swift.Result<Value, Swift.Error>
    
    internal var result: Event? {
        didSet {
            result.map(report)
            if case let .success(value) = self.result { self._value = value }
        }
    }
    
    var _value: Value?
    
    private var callbacks = [(Event) -> Void]()
    
    public func observe(using callback: @escaping (Event) -> Void) {
        if let result = result {
            return callback(result)
        }
        callbacks.append(callback)
    }
    
    private func report(result: Event) {
        callbacks.forEach { $0(result) }
    }
}
