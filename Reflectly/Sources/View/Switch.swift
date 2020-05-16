//
//  UISwitch+Action.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 5/13/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public class Switch: UISwitch {
    
    private var promise: Promise<Void> = Promise<Void>()
    
    @objc dynamic private func selector() {
        self.promise.result = .success(())
    }

    public func action(_ controlEvents: UIControl.Event = .valueChanged) -> Future<Void> {
        self.removeTarget(nil, action: nil, for: .allEvents)
        self.addTarget(self, action: #selector(selector), for: controlEvents)
        return promise
    }
    
    deinit {
        self.removeTarget(nil, action: nil, for: .allEvents)
        print(self,"deinit")
    }
    
}
