//
//  Pool.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 6/30/16.
//  Copyright © 2016 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class Pool {
    var indentifiers = [String]()
    var model: Object!
    init(_ model: Object, pool: String) {
        self.model = model
        self.indentifiers.append(pool)
    }
}
