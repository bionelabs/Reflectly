//
//  UIControlEvent.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 5/13/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class UIControlEvent {
    
    private var _action: () -> ()
    
    required init(_ target: Any, _ action: @escaping () -> ()) {
        self._action = action
        objc_setAssociatedObject(target, String(format: "[%d]", arc4random()), self, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc func selector() {
        self._action()
    }
    
    deinit {
        objc_removeAssociatedObjects(self)
        print(self,"deinit")
    }
}
