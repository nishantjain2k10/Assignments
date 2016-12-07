//
//  Test2ViewController.m
//  AppDelegateMethodsCheck
//
//  Created by Vaibhav Jain on 29/08/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "Test2ViewController.h"
#import "FormViewController.h";
#import "ImageScrollViewController.h";
#import "ViewController.h";

@interface Test2ViewController ()

@end

@implementation Test2ViewController

UIButton *button1;
UIButton *button2;





-(IBAction) perform
{
    //UIViewController *viewController = [FormViewController alloc];
    
    //[self.navigationController pushViewController: viewController animated:YES];
    
    
    

    
    
//    //get the existing navigationController view stack
//    NSMutableArray* newViewControllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
//    
//    //drop the last viewController and replace it with the new one!
//    FormViewController *childController = [[FormViewController alloc] initWithNibName:@"FormViewController" bundle:nil];
//    [newViewControllers replaceObjectAtIndex:newViewControllers.count-1 withObject:self];
//    
//     [self.navigationController pushViewController: childController animated:YES];
//    
//    //set the new view Controllers in the navigationController Stack
//    [self.navigationController setViewControllers:newViewControllers animated:YES];
    
    
    
    
//    [self.navigationController dismissViewControllerAnimated:YES completion:^{
//        
//        for (UIViewController *controller in self.navigationController.viewControllers)
//        {
//            if ([controller isKindOfClass:[Test2ViewController class]])
//            {
//                
//                [self.navigationController popToViewController:controller
//                                                      animated:YES];
//                break;
//            }
//        }
//        
//    }
//     ];
    
   //  [self.navigationController popViewControllerAnimated:NO];
    
    //CalculationViewController *ca = [CalculationViewController alloc];
    
    
    UIViewController *viewController = [FormViewController alloc];
    NSMutableArray* newViewControllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    
    
    
    [newViewControllers replaceObjectAtIndex:newViewControllers.count-1 withObject:viewController];
    
   
    
    [self.navigationController setViewControllers:newViewControllers animated:YES];

   
    
//    
//    NSMutableArray *controllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
//    [controllers removeObjectAtIndex:[controllers count] - 1]; //or whatever
//    [self.navigationController pushViewController: viewController animated:YES];
//    controllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
//    
//    [self.navigationController setViewControllers:controllers animated:YES];
   
    
    

}

-(IBAction) scrollImageView
{
    
    
    UIViewController *viewController = [ImageScrollViewController alloc];
    NSMutableArray* newViewControllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    
    
    
    [newViewControllers replaceObjectAtIndex:newViewControllers.count-1 withObject:viewController];
    
    
    
    [self.navigationController setViewControllers:newViewControllers animated:YES];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    ViewController *view;
    view = [ViewController alloc];
    [view addNavigationBarButton];
    button1 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(100, 150 , 80, 50);
    [button1 setTitle: @"Form" forState: UIControlStateNormal];
   [button1 addTarget: self action: @selector(perform) forControlEvents:UIControlEventTouchUpInside];
    [button1 setBackgroundColor: [UIColor lightGrayColor]];
    button1.layer.cornerRadius = 10;
    button1.clipsToBounds = YES;
    [ self.view addSubview:button1];
    
    
    
    button2 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(250, 150 , 80, 50);
    [button2 setTitle: @"ImageView" forState: UIControlStateNormal];
    [button2 addTarget: self action: @selector(scrollImageView) forControlEvents:UIControlEventTouchUpInside];
    [button2 setBackgroundColor: [UIColor lightGrayColor]];
    button2.layer.cornerRadius = 10;
    button2.clipsToBounds = YES;
    [ self.view addSubview:button2];
    
    
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
