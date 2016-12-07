//
//  ViewController.swift
//  ContainerViewDemo
//
//  Created by Vaibhav Jain on 13/10/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var componentA: UIView!
    @IBOutlet weak var componentB: UIView!
    
    @IBAction func chooseActionHandle(sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0 {
            UIView.animateWithDuration(0.5, animations: {
                self.componentA.alpha = 1
                self.componentB.alpha = 0
            })
        } else {
            UIView.animateWithDuration(0.5, animations: {
                self.componentA.alpha = 0
                self.componentB.alpha = 1
                
            })
            let controller = storyboard!.instantiateViewControllerWithIdentifier("button")
            self.addChildViewController(controller)
            controller.view.frame = CGRectMake(0, view.bounds.size.height-100, view.bounds.size.width, 100)
            self.view.addSubview(controller.view)
            controller.didMoveToParentViewController(self)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

