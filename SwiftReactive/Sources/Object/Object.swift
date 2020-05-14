//
//  Model.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 6/30/16.
//  Copyright © 2016 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

/* Model */
class Object {
    var _pools: Variable<[String]> = Variable<[String]>([])
    var _id: Variable<String> = Variable<String>("\(Date().timeIntervalSince1970)")
    var _created_at: Variable<Date> = Variable<Date>(Date())
}
