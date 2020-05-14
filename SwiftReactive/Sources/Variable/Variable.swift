//
//  Genenic.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 6/28/16.
//  Copyright © 2016 Cao Phuoc Thanh. All rights reserved.
//

/* Dynamic */

import Foundation

public class Variable<Element> {
    
    typealias Element = Element
    
    var value: Element {
        didSet {
            self.on(value)
        }
    }
    
    private func on(_ value: Element) {
        for (index, subscriber) in self.subscribers.enumerated() {
            guard let subscriber = subscriber.signal else {
                self.subscribers.remove(at: index)
                return
            }
            subscriber.listener(value)
        }
    }
    
    var subscribers: [Subscriber<Element>] = []
    
    init(_ value: Element) {
        self.value = value
    }
    
    func onNext(_ value: Element) {
        self.on(value)
    }
}

extension Variable {
    func asObservable() -> Future<Element> {
        let promise = Promise<Element>()
        Signal<Element> { value in
            promise.resolve(with: value)
        }.subscribe(genenic: self)
        return promise
    }
}


extension Variable {
    
    @discardableResult
    func observe(_ hander: @escaping (Element) -> Void) -> Variable<Element> {
        Signal<Element> { value in
            hander(value)
        }.subscribe(genenic: self)
        return self
    }

}


extension String {
    
    func variable() -> Variable<String> {
        return Variable<String>(self)
    }
}

extension Int {
    func variable() -> Variable<Int> {
        return Variable<Int>(self)
    }
}

extension Array {
    func variable() -> Variable<[Element]> {
        return Variable<[Element]>(self)
    }
}

extension Float {
    func variable() -> Variable<Float> {
        return Variable<Float>(self)
    }
}
