//
//  Observable.swift
//  SwiftReactive
//
//  Created by Cao Phuoc Thanh on 5/14/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

public class Variable<Value>: Future<Value> {
    
    public var value: Value {
        didSet {
            self.variable.value = value
        }
    }
    
    var variable: Genenic<Value>
    
    public required init(_ value: Value) {
        self.value = value
        self.variable = Genenic<Value>(value)
        super.init()
        Signal<Value> { value in
            self.result = .success(value)
        }.subscribe(genenic: variable)
    }
}
