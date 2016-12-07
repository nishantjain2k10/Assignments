//
//  ViewController.swift
//  containerAdd
//
//  Created by Vaibhav Jain on 13/10/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        
        return (min, max, sum)
    }
    
    func returnFifteen() -> Int {
        var y = 10
        func add() {
            y += 5
        }
        add()
        return y
    }
    
    
    //This means that a function can return another function as its value.
    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    
    func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        let controller = storyboard!.instantiateViewControllerWithIdentifier("button")
//        self.addChildViewController(controller)
//        controller.view.frame = CGRectMake(0, 250, self.view.bounds.size.width, self.view.bounds.size.height-250)
//        self.view.addSubview(controller.view)
//        controller.didMoveToParentViewController(self)
//        
//        let controller1 = storyboard!.instantiateViewControllerWithIdentifier("label")
//        self.addChildViewController(controller1)
//        controller1.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 250)
//        self.view.addSubview(controller1.view)
//        controller1.didMoveToParentViewController(self)
        
       
        
        
        let nickName: String? = nil
        let fullName: String = "John Appleseed"
        let informalGreeting = "Hi \(nickName ?? fullName)"
        print(informalGreeting)
        print(nickName)
        
        
        let statistics = calculateStatistics([5, 3, 100, 3, 9])
        print(statistics.sum)
        print(statistics.2)
        let result = returnFifteen()
        print(result)
        
        let increment = makeIncrementer()
        let value = increment(7)
        print(value)
        
        let numbers = [20, 9, 6, 12]
        let result1 = hasAnyMatches(numbers, condition: lessThanTen)
        print(result1)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
        var token1 = "ninja"
        appDelegate.loginApi { (tokenString) in
            token1 = tokenString
            print(token1)
            print("first api completed")
            
            let request1 = NSMutableURLRequest(URL: NSURL(string: "http://local.veris.in:8005/api/v3/terminal/41/screen/")!)
            
            let session1 = NSURLSession.sharedSession()
            request1.HTTPMethod = "GET"
            request1.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request1.addValue( "gatekeeper "+token1, forHTTPHeaderField: "Authorization")
            
            //request1.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(json, options: [])
            
            // or if you think the conversion might actually fail (which is unlikely if you built `params` yourself)
            //
            // do {
            //    request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: [])
            // } catch {
            //    print(error)
            // }
            
            let task1 = session1.dataTaskWithRequest(request1) { data, response, error in
                guard data != nil else {
                    print("no data found: \(error)")
                    return
                }
                
                
                // this, on the other hand, can quite easily fail if there's a server error, so you definitely
                // want to wrap this in `do`-`try`-`catch`:
                
                do {
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                        let success = json["count"] as! Int                                // Okay, the `json` is here, let's get the value for 'success' out of it
                        print("Success: \(success)")
                        print("Enjoy the morning")
                        print(json.count)
                        print(response)
                        
                        
                    } else {
                        let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)    // No error thrown, but not NSDictionary
                        print("Error could not parse JSON: \(jsonStr)")
                    }
                } catch let parseError {
                    print(parseError)                                                          // Log the error thrown by `JSONObjectWithData`
                    let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    print("Error could not parse JSON: '\(jsonStr)'")
                }
            }
            
            task1.resume()

        }
        
        

        
        
        
        
        
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

