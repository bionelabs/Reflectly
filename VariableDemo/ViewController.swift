//
//  ViewController.swift
//  VariableDemo
//
//  Created by Cao Phuoc Thanh on 5/14/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import Variable

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        //self.testVarialbeOberver()
        self.testObservable()
        
    }
    
    func testObservable() {
        
        
        let variable: Variable<Int> = Variable<Int>(0)
        
        variable
            .debounce(interval: 200)
            .observe { (result) in
                if case let .success(vax) = result {
                    print("result success:", vax)
                }
        }
        
        
        DispatchQueue.global(qos: .background).async {
            variable.value = 3
            usleep(100 * 1000)
            variable.value = 2
            usleep(100 * 1000)
            variable.value = 3
            usleep(100 * 1000)
            variable.value = 4
            usleep(300 * 1000) // waiting a bit longer than the interval
            variable.value = 5
            usleep(100 * 1000)
            variable.value = 6
            usleep(100 * 1000)
            variable.value = 7
            usleep(300 * 1000) // waiting a bit longer than the interval
            variable.value = 8
            usleep(100 * 1000)
            variable.value = 9
            usleep(100 * 1000)
            variable.value = 10
            usleep(100 * 1000)
            variable.value = 11
            usleep(100 * 1000)
            variable.value = 12
        }
    }
    
    func testVarialbeOberver() {
        
        let generic = Genenic<Int>(0)
        
        generic
            .asObservable()
            .then {$0 + 100 }
            .debounce(interval: 200)
            .observe { event in
                if case let .success(vax) = event {
                    print("ghjfjhg:", vax)
                }
        }
        
        DispatchQueue.global(qos: .background).async {
            generic.value = 3
            usleep(100 * 1000)
            generic.value = 2
            usleep(100 * 1000)
            generic.value = 3
            usleep(100 * 1000)
            generic.value = 4
            usleep(300 * 1000) // waiting a bit longer than the interval
            generic.value = 5
            usleep(100 * 1000)
            generic.value = 6
            usleep(100 * 1000)
            generic.value = 7
            usleep(300 * 1000) // waiting a bit longer than the interval
            generic.value = 8
            usleep(100 * 1000)
            generic.value = 9
            usleep(100 * 1000)
            generic.value = 10
            usleep(100 * 1000)
            generic.value = 11
            usleep(100 * 1000)
            generic.value = 12
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

