//
//  ViewController.swift
//  UseObjectiveCinSwift
//
//  Created by Vaibhav Jain on 21/10/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let instanceOfCustomObject: CustomObject = CustomObject()
        instanceOfCustomObject.someProperty = "Hello World"
        print(instanceOfCustomObject.someProperty)
        instanceOfCustomObject.someMethod()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

