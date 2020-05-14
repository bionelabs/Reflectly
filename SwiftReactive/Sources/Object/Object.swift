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
    var _pools: Genenic<[String]> = Genenic<[String]>([])
    var _id: Genenic<String> = Genenic<String>("\(Date().timeIntervalSince1970)")
    var _created_at: Genenic<Date> = Genenic<Date>(Date())
}
