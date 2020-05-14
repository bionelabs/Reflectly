//
//  UISwitch+Action.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 5/13/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension UISwitch {
    
    public func action(_ controlEvents: UIControl.Event = .valueChanged) -> Future<Bool> {
        let promise = Promise<Bool>()
        self.removeTarget(nil, action: #selector(UIControlEvent.selector), for: controlEvents)
        let action = UIControlEvent(self, {
            promise.resolve(with: true)
        })
        self.addTarget(action, action: #selector(UIControlEvent.selector), for: controlEvents)
        return promise
    }
    
}
