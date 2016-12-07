//
//  ViewController.h
//  PageViewControllerDemo
//
//  Created by Vaibhav Jain on 22/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic,strong) UIPageViewController *pageController;
 
 
@end

