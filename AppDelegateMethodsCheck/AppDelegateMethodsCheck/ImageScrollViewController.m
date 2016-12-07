//
//  ImageScrollViewController.m
//  AppDelegateMethodsCheck
//
//  Created by Vaibhav Jain on 31/08/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ImageScrollViewController.h"
#import "ViewController.h"

@interface ImageScrollViewController ()

@property(nonatomic) int counter;

@end

@implementation ImageScrollViewController

UIScrollView *myScrollImageView;
UIButton *previous;
UIButton *next;
UIPageControl *pageControl;
UIImageView *imageView;

-(void)setIndex
{
    
}


-(IBAction)setScrollViewIndex:(id)selector
{
    if([selector isKindOfClass:[UIButton class]])
    {
        UIButton *button = (UIButton*)selector;
        if([button.currentTitle isEqualToString:@"Previous"])
        {
            [next setEnabled:YES];
            if(self.counter ==1)
            {
                 [previous setEnabled: NO];
            }
            self.counter=self.counter-1;
            [imageView setImage:[UIImage imageNamed:[imagesArray objectAtIndex:self.counter]]];
            pageControl.currentPage=self.counter;

        }
        else if([button.currentTitle isEqualToString:@"Next"])
        {
            [previous setEnabled:YES];
            if(self.counter == imagesArray.count-2)
            {
                [next setEnabled:NO];
            }
            self.counter=self.counter+1;
            [imageView setImage:[UIImage imageNamed:[imagesArray objectAtIndex:self.counter]]];
            pageControl.currentPage=self.counter;

        }
    }
    else if([selector isKindOfClass:[UIPageControl class]])
    {
        UIPageControl *control = (UIPageControl *)selector;
        if(control.currentPage == 0 )
        {
            self.counter = (int)control.currentPage;
            [previous setEnabled: NO];
            [imageView setImage:[UIImage imageNamed:[imagesArray objectAtIndex:self.counter]]];
            //pageControl.currentPage=self.counter;
            
        }
        else if(control.currentPage == (imagesArray.count-1))
        {
            self.counter = (int)control.currentPage;
            [next setEnabled:NO];
            [imageView setImage:[UIImage imageNamed:[imagesArray objectAtIndex:self.counter]]];
            //pageControl.currentPage=self.counter;
        }
        else
        {
            self.counter = (int)control.currentPage;
            [previous setEnabled:YES];
            [next setEnabled:YES];
            [imageView setImage:[UIImage imageNamed:[imagesArray objectAtIndex:self.counter]]];
           // pageControl.currentPage=self.counter;
            
        }
    }
 }


- (void)viewDidLoad {
    [super viewDidLoad];
//    ViewController *view;
//    view = [ViewController alloc];
//    [view addNavigationBarButton];

    
    self.view.backgroundColor = [UIColor  brownColor];
    myScrollImageView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height/2)];
    myScrollImageView.backgroundColor = [UIColor cyanColor];
    myScrollImageView.scrollEnabled = YES;
    myScrollImageView.pagingEnabled = YES;
    myScrollImageView.showsVerticalScrollIndicator = YES;
    myScrollImageView.showsHorizontalScrollIndicator = YES;
    //myScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 2, self.view.bounds.size.height);
    
    imagesArray = [NSArray arrayWithObjects:@"img1.jpg", @"img2.jpg", @"img3.jpg", nil];
    
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, myScrollImageView.bounds.size.width, myScrollImageView.bounds.size.height)];
    [imageView setImage:[UIImage imageNamed:[imagesArray objectAtIndex:0]]];
        //[imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    [myScrollImageView addSubview:imageView];
    
    
    [myScrollImageView setContentSize:CGSizeMake(myScrollImageView.bounds.size.width, myScrollImageView.bounds.size.height/2)];

    [self.view addSubview:myScrollImageView];
    
    
    pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(100, self.view.bounds.size.height/2+30, 130, 140);
    pageControl.numberOfPages = imagesArray.count;
    pageControl.currentPage = 0;
    //pageControl.backgroundColor=[UIColor blueColor];
    pageControl.tintColor = [UIColor brownColor];
    [pageControl addTarget:self action:@selector(setScrollViewIndex:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pageControl];
    
    previous = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    previous.frame = CGRectMake(100, self.view.bounds.size.height/2+230 , 80, 50);
    [previous setTitle: @"Previous" forState: UIControlStateNormal];
    [previous addTarget: self action: @selector(setScrollViewIndex:) forControlEvents:UIControlEventTouchUpInside];
    [previous setBackgroundColor: [UIColor lightGrayColor]];
    previous.layer.cornerRadius = 10;
    previous.clipsToBounds = YES;
    

    [previous setEnabled: NO];
    [self.view addSubview:previous];
    
    
    
    
    next = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    next.frame = CGRectMake(250, self.view.bounds.size.height/2+230 , 80, 50);
    [next setTitle: @"Next" forState: UIControlStateNormal];
    [next addTarget: self action: @selector(setScrollViewIndex:) forControlEvents:UIControlEventTouchUpInside];
    [next setBackgroundColor: [UIColor lightGrayColor]];
    next.layer.cornerRadius = 10;
    next.clipsToBounds = YES;
 
    [self.view addSubview:next];
    
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
