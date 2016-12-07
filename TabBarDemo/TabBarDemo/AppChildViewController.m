//
//  AppChildViewController.m
//  PageViewControllerDemo
//
//  Created by Vaibhav Jain on 22/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "AppChildViewController.h"

@interface AppChildViewController ()

{
    NSArray *images;
    UIImageView *imageView;
}

@end

@implementation AppChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blueColor];
    
    images = [NSArray arrayWithObjects: @"img1.jpg" ,@"img2.jpg",@"img3.jpg",@"11.png",@"12.png",@"13.png",nil];

//    CGRect newFrame;
//    newFrame.size.width = self.view.bounds.size.width;
//    newFrame.size.height= self.view.bounds.size.height-40;
//    
//    [self.view setFrame:newFrame];

//    CGRect labelFrame = CGRectMake(100, 100, 100, 40);
//    screenNumber = [[UILabel alloc]initWithFrame:labelFrame];
//    screenNumber.textAlignment=NSTextAlignmentCenter;
//    screenNumber.textColor=[UIColor whiteColor];
//    screenNumber.text=[NSString stringWithFormat:@"Screen # %ld",(long)self.index];
    
    imageView = [[UIImageView alloc]initWithFrame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [imageView setImage: [UIImage imageNamed: [images objectAtIndex:self.index]]];
                 
    [self.view addSubview:imageView];
    
    
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
