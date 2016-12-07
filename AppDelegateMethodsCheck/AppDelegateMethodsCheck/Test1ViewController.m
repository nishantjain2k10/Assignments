//
//  Test1ViewController.m
//  AppDelegateMethodsCheck
//
//  Created by Vaibhav Jain on 29/08/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "Test1ViewController.h"
#import "CalculationViewController.h"
#import "ViewController.h";



@interface Test1ViewController ()

@end

@implementation Test1ViewController




UIButton *button;




- (void)didPressButton:(UIButton *)sender
{
    
    //UIViewController *viewController = [CalculationViewController alloc];
    
    UIViewController *viewController = [CalculationViewController alloc];
    
    [self.navigationController pushViewController: viewController animated:YES];
    
    //[self.navigationController presentModalViewController: viewController animated:YES  ];
    
    //[self.navigationController presentViewController: viewController animated:YES ];
    
    
    

}



- (void)viewDidLoad {
    [super viewDidLoad];
    ViewController *view;
    view = [ViewController alloc];
    [view addNavigationBarButton];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100.0, 100.0, 100.0, 40.0);
    [button setTitle:@"Press" forState:UIControlStateNormal];
    [button setBackgroundColor: [UIColor lightGrayColor]];
    
    
    [ self.view addSubview:button];
    
    [button addTarget:self action:@selector(didPressButton:) forControlEvents:UIControlEventTouchUpInside];

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
