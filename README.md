# Swift Reflectly

I learn how to make a reactive function, variable, and custom UI with closure for action.
And I don't want to use <b>"disposableBag"</b>.
So I make this library from <b>2015</b>.
I have known my library not good. But I learn a lot about reactive programming.

## Reactive
1. <b>Promise</b>: Function response in queue with operators
2. <b>Variable</b>: Variable reactive when it changed 
3. <b>UI Reactive</b>: Button, Switch, Custome by Promise

## Operators
- throttle
- debounce
- filter
- distinct
- map

## Promise

```swift
        let promies: Promise<String?> = Promise<String?>()
        promies
            .map { $0 }
            .throttle(interval: 500)
            .debounce(interval: 200)
            .filter { ($0?.contains("3") ?? false) }
            .distinct()
            .observe { (result) in
                guard case let .success(vax) = result else { return }
                print("result success:", vax)
        }
        
        promies.resolve(nil)
        promies.resolve("334")
        promies.resolve("22")
        promies.resolve("44")
        promies.resolve("32")
```

## Variable

```swift

let variable: Variable<Int> = Variable<Int>(0)
        
        variable
            .map { $0 + 1212 }
            .throttle(interval: 500)
            .debounce(interval: 200)
            .filter {$0 > 10}
            .observe { (result) in
                guard case let .success(vax) = result else { return }
                print("result success:", vax)
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

```

## UI Reactive

```swift

class ViewController: UIViewController {
    
    let button: Button = {
       let button = Button()
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.setTitle("A", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        
        button
        .action()
        .debounce(interval: 200)
        .observe { [weak self] (event) in
            guard let `self` = self else { return}
            let vc = AViewController()
            vc.variable = self.variable
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

```

### Reference
1. [map, flatMap and compactMap](https://www.hackingwithswift.com/articles/205/whats-the-difference-between-map-flatmap-and-compactmap)
2. [Under the hood of Futures and Promises in Swift](https://www.swiftbysundell.com/articles/under-the-hood-of-futures-and-promises-in-swift/)
3. [Promises by Google](https://github.com/google/promises/blob/master/g3doc/index.md#creating-promises)
4. [RxSwift](https://github.com/ReactiveX/RxSwift/)
5. [Promise Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise)


## Contact
- Email: caophuocthanh@gmail.com
- Site: https://onebuffer.com
- Linkedin: https://www.linkedin.com/in/caophuocthanh/
