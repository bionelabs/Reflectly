//
//  React.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 6/28/16.
//  Copyright © 2016 Cao Phuoc Thanh. All rights reserved.
//

internal class Signal<Value> {
    
    typealias Listener = (Value) -> ()
    
    var listener: Listener
    
    init(_ listener: @escaping Listener) {
        self.listener = listener
    }
    
    func subscribe(genenic: Variable<Value>) {
        genenic.subscribers.append(Subscriber(self))
    }
}
