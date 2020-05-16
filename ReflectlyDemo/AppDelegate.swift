//
//  AppDelegate.swift
//  VariableDemo
//
//  Created by Cao Phuoc Thanh on 5/14/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window    = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window = window
        let viewController = ViewController()
        let nv = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = nv
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    
}

