//
//  GenericFuture.swift
//  VariableDemo
//
//  Created by Cao Phuoc Thanh on 5/15/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

extension Genenic {
    
    public func asObservable() -> Future<Element> {
        let promise = Promise<Element>()
        Signal<Element> { value in
            promise.resolve(value)
        }.subscribe(genenic: self)
        return promise
    }
    
}
