//
//  MySwiftObject.swift
//  UseObjectiveCinSwift
//
//  Created by Vaibhav Jain on 21/10/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

import UIKit

 class MySwiftObject: NSObject {

    var someProperty: AnyObject = "Some Initializer Val"
    
    
    
    func someFunction(someArg:AnyObject) -> String {
        let returnVal = "You sent me \(someArg)"
        return returnVal
    }

}


