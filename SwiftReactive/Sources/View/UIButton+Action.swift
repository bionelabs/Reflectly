//
//  View.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 5/11/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension UIButton {
    
    public func action(_ controlEvents: UIControl.Event = .touchUpInside) -> Future<UIButton> {
        let promise = Promise<UIButton>()
        self.removeTarget(nil, action: #selector(UIControlEvent.selector), for: controlEvents)
        let action = UIControlEvent(self, {
            promise.resolve(self)
        })
        self.addTarget(action, action: #selector(UIControlEvent.selector), for: controlEvents)
        return promise
    }    
}
