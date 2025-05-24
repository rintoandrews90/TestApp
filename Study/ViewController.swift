//
//  ViewController.swift
//  Study
//
//  Created by Rinto Andrews on 15/05/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var person: Person? = Person(name: "Alice")

        // Get reference count (unsafe, debugging use only)
        let count = CFGetRetainCount(person)
        print("Reference count: \(count)")  // Typically starts at 2

        var p2 = person
        p2 = nil
        print("Reference count: \(CFGetRetainCount(person))")
    }
}

 
class A {
    fileprivate var name: String
    
    init(name: String) {
        self.name = name
    }
}
 
class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
}


