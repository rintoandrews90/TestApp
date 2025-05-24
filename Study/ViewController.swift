//
//  ViewController.swift
//  Study
//
//  Created by Rinto Andrews on 15/05/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtlbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var person: Person? = Person(name: "Alice")

        // Get reference count (unsafe, debugging use only)
        let count = CFGetRetainCount(person)
        print("Reference count: \(count)")  // Typically starts at 2

        var p2 = person
        p2 = nil
        print("Reference count: \(CFGetRetainCount(person))")
        
        if let path = Bundle.main.path(forResource: "apikey", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: Any],
           let apiKey = dict["APIKey"] as? String {
            print("API Key: \(apiKey)")
            
            txtlbl.text = apiKey
        }
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


