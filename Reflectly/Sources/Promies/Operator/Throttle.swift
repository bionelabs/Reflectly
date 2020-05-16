//
//  Throttle.swift
//  VariableDemo
//
//  Created by Cao Phuoc Thanh on 5/16/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import Foundation

extension Future {
    
    typealias Throttle<Element> = (_ : Element) -> Void
    
    private func throttle<Element>(interval: Int, queue: DispatchQueue, action: @escaping Throttle<Element>) -> Throttle<Element> {
        var lastFireTime = DispatchTime.now()
        let dispatchDelay = DispatchTimeInterval.milliseconds(interval)
        return { param in
            let dispatchTime: DispatchTime = DispatchTime.now() + dispatchDelay
            
            queue.asyncAfter(deadline: dispatchTime) {
                let when: DispatchTime = lastFireTime + dispatchDelay
                let now = DispatchTime.now()
                if now.rawValue >= when.rawValue {
                    lastFireTime = now
                    action(param)
                }
            }
        }
    }
    
    public func throttle(interval: Int) -> Future<Value> {
        let promise = Promise<Value>()
        let throttle: Throttle<Value> = self.throttle(interval: interval, queue: DispatchQueue.main) { (value: Value) in
            promise.resolve(value)
        }
        observe { result in
            switch result {
            case .success(let value): throttle(value)
            case .failure(let error): promise.reject(error)
            }
        }
        return promise
    }
    
}
