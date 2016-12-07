//
//  ViewController.m
//  App1ScrollView
//
//  Created by Vaibhav Jain on 21/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "HomeViewController.h"
#import "ScrollingFeature.h"

@interface HomeViewController ()
{
    ScrollingFeature *scrollView1;
    ScrollingFeature *scrollView2;
    ScrollingFeature *scrollView3;
    
    NSArray *images;
}

@property(nonatomic) NSTimer *scrollTimer;

@end

@implementation HomeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    images = [NSArray arrayWithObjects: @"img1.jpg" ,@"img2.jpg",@"img3.jpg",@"11.png",@"12.png",@"13.png",nil];
    CGRect frame= CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/3);
    scrollView1 = [[ScrollingFeature alloc]initWithFrame:frame];
    [scrollView1 setPagingEnabled:YES];
    [scrollView1 setAlwaysBounceVertical:NO];
    [scrollView1 setConstraints:images NumberOfItemsPerPage:1];
  
    self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:scrollView1 selector:@selector(timerFired) userInfo:nil repeats:YES];

    
    
    frame = CGRectMake(0, self.view.bounds.size.height/3, self.view.bounds.size.width, self.view.bounds.size.height/3);
    scrollView2 = [[ScrollingFeature alloc]initWithFrame:frame];
    [scrollView2 setPagingEnabled:YES];
    [scrollView2 setAlwaysBounceVertical:NO];
    [scrollView2 setConstraints:images NumberOfItemsPerPage:2];
    self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:scrollView2 selector:@selector(timerFired) userInfo:nil repeats:YES];


    frame = CGRectMake(0, 2*self.view.bounds.size.height/3, self.view.bounds.size.width, self.view.bounds.size.height/3);
    scrollView3=[[ScrollingFeature alloc]initWithFrame:frame];
    [scrollView3 setPagingEnabled:YES];
    [scrollView3 setAlwaysBounceVertical:NO];
    [scrollView3 setConstraints:images NumberOfItemsPerPage:3];
    self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:scrollView3 selector:@selector(timerFired) userInfo:nil repeats:YES];

    
    
    [self.view addSubview: scrollView1];
    [self.view addSubview:scrollView2];
    [self.view addSubview:scrollView3];
    
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
