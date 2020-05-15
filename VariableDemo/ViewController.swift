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
    
    let button: Button = {
       let button = Button()
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.setTitle("A", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    let variable: Variable<String> = Variable<String>("0")
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        
        variable
            .throttle(interval: 1500)
            .map {$0 + "_\(self.description)"}
            .observe { (result) in
            guard case let .success(value) = result else { return }
            print("🍄🍄🍄 varialbe:", value, Date())
        }
        
        button.action().observe { [weak self] (event) in
            guard let `self` = self else { return}
            let vc = AViewController()
            vc.variable = self.variable
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        //self.testVarialbeOberver()
        //self.testObservable()
        //self.testPromies()
        //self.testOptional()
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func testOptional() {
        let promies: Promise<String?> = Promise<String?>()
        promies
            .map { $0 }
            .observe { (result) in
                guard case let .success(vax) = result else { return }
                print("result success:", vax)
        }
        
        promies.resolve(nil)
        promies.resolve("334")
        promies.resolve("22")
        promies.resolve("44")
        promies.resolve("32")

    }
    
    func testString() {
        let promies = Promise.just("sdfsdf")
        promies
            .map { $0 + "0" }
            .observe { (result) in
                guard case let .success(vax) = result else { return }
                print("result success:", vax)
        }
        promies.resolve("12")
        promies.resolve("334")
        promies.resolve("22")
        promies.resolve("44")
        promies.resolve("32")
    }
    
    
    func testPromies() {
        let promies = Promise<Int>()
        promies
            .map { $0 + 1212 }
            .observe { (result) in
                guard case let .success(vax) = result else { return }
                print("result success:", vax)
        }
        promies.resolve(12)
        promies.resolve(334)
        promies.resolve(22)
        promies.resolve(44)
        promies.resolve(32)
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
            variable.value = 7
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
            .map { $0 + 100 }
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
    
    
    deinit {
        print(self, "deinit")
    }
}

