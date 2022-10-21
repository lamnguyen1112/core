//
//  ViewController.swift
//  Example
//
//  Created by Lazyman on 10/21/22.
//

import UIKit
import CoreExtension

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var cal = Calculate()
        let result = cal.add(a: 2, b: 3)
        print(result)
    }
}

