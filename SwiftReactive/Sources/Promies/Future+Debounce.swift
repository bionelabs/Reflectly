//
//  Future+Debounce.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 5/13/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import Foundation

extension Future {
    
    typealias Debounce<Element> = (_ : Element) -> Void
    
    private func debounce<Element>(interval: Int, queue: DispatchQueue, action: @escaping Debounce<Element>) -> Debounce<Element> {
        var lastFireTime = DispatchTime.now()
        let dispatchDelay = DispatchTimeInterval.milliseconds(interval)
        return { param in
            lastFireTime = DispatchTime.now()
            let dispatchTime: DispatchTime = DispatchTime.now() + dispatchDelay
            
            queue.asyncAfter(deadline: dispatchTime) {
                let when: DispatchTime = lastFireTime + dispatchDelay
                let now = DispatchTime.now()
                
                if now.rawValue >= when.rawValue {
                    action(param)
                }
            }
        }
    }
    
    public func debounce(interval: Int) -> Future<Value> {
        let promise = Promise<Value>()
        let debounce: Debounce<Value> = self.debounce(interval: interval, queue: DispatchQueue.main) { (value: Value) in
            promise.resolve(with: value)
        }
        observe { result in
            switch result {
            case .success(let value): debounce(value)
            case .failure(let error): promise.reject(with: error)
            }
        }
        return promise
    }
    
}
