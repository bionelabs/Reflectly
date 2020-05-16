//
//  AViewController.swift
//  VariableDemo
//
//  Created by Cao Phuoc Thanh on 5/15/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import Reflectly

class AViewController: UIViewController {

    weak var variable: Variable<String>? {
        didSet {
            self.variable?
                .distinct()
                .observe { (result) in
                guard case let .success(value) = result else { return }
                print("👻👻👻 varialbe:", value)
            }
        }
    }
    
    
    let textField: UITextField = {
       let view = UITextField()
        view.frame = CGRect(x: 0, y: 100, width: 200, height: 50)
        view.placeholder = "Input"
        view.backgroundColor = .lightGray
        return view
    }()
    
    let button: Button = {
       let button = Button()
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        button.setTitle("Tap", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    let buttonDissmis: Button = {
       let button = Button()
        button.frame = CGRect(x: 100, y: 280, width: 200, height: 50)
        button.setTitle("Dimmies", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        self.view.addSubview(textField)
        self.view.addSubview(button)
        self.view.addSubview(buttonDissmis)
        
        button.action().observe { [weak self] (_) in
            self?.variable?.value = self?.textField.text ?? ""
        }
        
        buttonDissmis.action().observe { [weak self] (_) in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    deinit {
        print(self, "deinit")
    }

}
