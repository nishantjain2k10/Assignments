//
//  ViewController.m
//  PageViewControllerDemo
//
//  Created by Vaibhav Jain on 22/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "PageViewController.h"
#import "AppChildViewController.h"

@interface PageViewController ()


@end

@implementation PageViewController



- (AppChildViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    AppChildViewController *childViewController  = [[AppChildViewController alloc]init];
   //AppChildViewController *childViewController = [[AppChildViewController alloc] initWithNibName:@"AppChildViewController"bundle:nil];
    
    childViewController.index = index;
    
    return childViewController;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(AppChildViewController *)viewController index];
    
   //[self.pcDots setCurrentPage:index];
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(AppChildViewController *)viewController index];
    
    //[self.pcDots setCurrentPage:index];
    index++;
    
    if (index == 5) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

// for dots display


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    
    return 5;

}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.pageController =[[UIPageViewController alloc]initWithTransitionStyle: UIPageViewControllerTransitionStyleScroll navigationOrientation: UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    [[UIPageControl appearance] setPageIndicatorTintColor: [UIColor grayColor]];
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor: [UIColor whiteColor]];
    [[UIPageControl appearance] setBackgroundColor: [UIColor darkGrayColor]];
    self.pageController.dataSource=self;
    self.pageController.delegate=self;
    self.pageController.view.frame= self.view.bounds;
    AppChildViewController *initialViewController = [self viewControllerAtIndex: 0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    [self.pageController setViewControllers: viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self addChildViewController:self.pageController];
    
    [self.view addSubview:self.pageController.view];
    
    [self.pageController didMoveToParentViewController:self];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
