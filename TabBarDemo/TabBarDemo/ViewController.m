//
//  ViewController.m
//  TabBarDemo
//
//  Created by Vaibhav Jain on 23/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ViewController.h"
#import "myViewController1.h"
#import "myViewController2.h"
#import "HomeViewController.h"
#import "PageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    self.view.backgroundColor =[UIColor blueColor];
//    self.tabBarController = [[UITabBarController alloc] init];
//    
//    myViewController1 *vc1 = [[myViewController1 alloc] init];
//    myViewController2 *vc2 = [[myViewController2 alloc] init];
//    
//    
//    vc1.view.backgroundColor = [UIColor brownColor];
//    vc1.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"First" image:[UIImage imageNamed:@"home.png"] selectedImage: [UIImage imageNamed:@"home.png"]];
//    vc2.tabBarItem= [[UITabBarItem alloc]initWithTitle:@"Second"  image:[UIImage imageNamed:@"background.jpg"] selectedImage: [UIImage imageNamed:@"background.jpg"]];
//    //imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal;
//    
//    //vc2.tabBarItem.image= [UIImage imageNamed:@"home.png"];
//    vc2.view.backgroundColor = [UIColor greenColor];
//    
//         
//    NSArray* controllers = [NSArray arrayWithObjects:vc1, vc2, nil];
//    
//    self.tabBarController.viewControllers = controllers;
//    
//    self.tabBarController.view.autoresizingMask = (UIViewAutoresizingFlexibleHeight);
//    
//    [self.view addSubview: self.tabBarController.view];
//    
    
    
    //self.view.backgroundColor = [UIColor blackColor];
    
    myViewController1 *vc1 = [[myViewController1 alloc] init];
    vc1.title = @"FIRST";
    
    vc1.tabBarItem.image = [[UIImage imageNamed:@"2.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //vc1.tabBarItem.title = @"First";
   
    
    HomeViewController *vc2 = [[HomeViewController alloc] init];
    //vc2.title = @"SECOND";
    vc2.tabBarItem.title = @"First";
    vc2.tabBarItem.image = [[UIImage imageNamed:@"background"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //vc2.view.backgroundColor = [UIColor redColor];
    
    PageViewController *vc3 = [[PageViewController alloc] init];
    vc3.title = @"Third";
    //vc3.view.backgroundColor = [UIColor greenColor];

    
    myViewController2 *vc4 = [[myViewController2 alloc] init];
    vc4.title = @"Fourth";
    vc4.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.title = @"Fifth";
    vc5.view.backgroundColor = [UIColor grayColor];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.title = @"Sixth";
    vc6.view.backgroundColor = [UIColor greenColor];
 
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.tabBar.barTintColor = [UIColor blackColor];
    tabBarController.tabBar.tintColor=[UIColor greenColor];
    
    
    tabBarController.viewControllers = @[vc1,vc2,vc3,vc4,vc5,vc6];
    tabBarController.selectedIndex   = 0;
    tabBarController.view.frame = CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
    
    [tabBarController willMoveToParentViewController:self];
    [self.view addSubview:tabBarController.view];
    [self addChildViewController:tabBarController];
    [tabBarController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
