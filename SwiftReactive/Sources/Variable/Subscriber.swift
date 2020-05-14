//
//  Box.swift
//  Flux
//
//  Created by Cao Phuoc Thanh on 6/28/16.
//  Copyright © 2016 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

/* Box */
internal class Subscriber<Element> {

    var signal: Signal<Element>?
    
    init(_ signal: Signal<Element>) {
        self.signal = signal
    }
}
