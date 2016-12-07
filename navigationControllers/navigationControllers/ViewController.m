//
//  ViewController.m
//  navigationControllers
//
//  Created by Vaibhav Jain on 30/08/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)goHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]
//                                    initWithImage:[UIImageimageNamed:@"home.png"]
//                                    style:UIBarButtonItemStylePlain
//                                    target:self
//                                    action:@selector(goHome:)];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                    target:self
                                    action:@selector(goHome:)];
//    
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]
//                                    initWithTitle:@"Code"
//                                    style:UIBarButtonItemStylePlain
//                                    target:self
//                                    action:@selector(showDocco:)];
    
    
    
    
    [self.navigationItem setTitle:@"Type Tester"];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
//    
//    To push a controller:
//    SecondViewController *viewController = [[SecondViewController alloc] initWithNibName:@"SecondView" bundle:nil];
//    [[self navigationController] pushViewController:viewController animated: YES];
//    [viewController release];
//    When popping an item, the current view slides right and is deallocated:
//    
//    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
