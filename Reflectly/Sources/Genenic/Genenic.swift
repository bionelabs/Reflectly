//
//  Genenic.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 6/28/16.
//  Copyright © 2016 Cao Phuoc Thanh. All rights reserved.
//

/* Dynamic */

import Foundation

open class Genenic<Element> {
    
    typealias Element = Element
    
    public var value: Element {
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
    
    public init(_ value: Element) {
        self.value = value
    }
    
    @discardableResult
    public
    func observe(_ hander: @escaping (Element) -> Void) -> Genenic<Element> {
        Signal<Element> { value in
            hander(value)
        }.subscribe(genenic: self)
        return self
    }
        
}


