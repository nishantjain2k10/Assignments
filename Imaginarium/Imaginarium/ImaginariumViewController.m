//
//  ImaginariumViewController.m
//  Imaginarium
//
//  Created by Vaibhav Jain on 09/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ImaginariumViewController.h"

@interface ImaginariumViewController () <UIScrollViewDelegate> // this  is a protocol


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;



@end

@implementation ImaginariumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = self.imageView.image.size;
    self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
    NSLog(@"size of view %f %f",self.view.frame.size.width,self.view.frame.size.height);
    NSLog(@"size of imageView %f %f",self.imageView.frame.size.width,self.imageView.frame.size.height);
    NSLog(@"size of scrollView %f %f",self.scrollView.frame.size.width,self.scrollView.frame.size.height);
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
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
