//
//  Button.swift
//  VariableDemo
//
//  Created by Cao Phuoc Thanh on 5/15/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public class Button: UIButton {
        
    private var promise: Promise<Void> = Promise<Void>()
    
    @objc dynamic private func selector() {
        self.promise.result = .success(())
    }

    public func action(_ controlEvents: UIControl.Event = .touchUpInside) -> Future<Void> {
        self.removeTarget(nil, action: nil, for: .allEvents)
        self.addTarget(self, action: #selector(selector), for: controlEvents)
        return promise
    }
    
    deinit {
        self.removeTarget(nil, action: nil, for: .allEvents)
        print(self,"deinit")
    }
    
}
