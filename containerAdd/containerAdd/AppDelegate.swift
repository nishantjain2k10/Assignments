//
//  AppDelegate.swift
//  containerAdd
//
//  Created by Vaibhav Jain on 13/10/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    
    
     
    
    func loginApi(completionHandler: (tokenString: String) -> ())
    {
        var token = "ninja"
        
        
        let json = [ "username":"FGN68836",
                     "password":"36663505",
                     "module":"54beb728-a643-4404-9083-1efb29b32856",
                     "device_name":"Moto",
                     "device_os":"android",
                     "registration_id":"656528916652652" ]
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://local.veris.in:8005/api/v3/gatekeeper-login/")!)
        
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue("gatekeeper becc50b5f6e425bf4ad9fd03882994fe47c314a8", forHTTPHeaderField: "Authorization")
        
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(json, options: [])
        
        // or if you think the conversion might actually fail (which is unlikely if you built `params` yourself)
        //
        // do {
        //    request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: [])
        // } catch {
        //    print(error)
        // }
        
        let task = session.dataTaskWithRequest(request) { data, response, error in
            guard data != nil else {
                print("no data found: \(error)")
                return
            }
            
            
            // this, on the other hand, can quite easily fail if there's a server error, so you definitely
            // want to wrap this in `do`-`try`-`catch`:
            
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                    let success = json["veristoken"]  as! String                         // Okay, the `json` is here, let's get the value for 'success' out of it
                    token = success
                    print("Success: \(success)")
                    print("Enjoy the evening")
                    print(response)
                    completionHandler(tokenString: token)
                    
                    
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
        
        task.resume()
        

    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

