//
//  myViewController2.m
//  TabBarDemo
//
//  Created by Vaibhav Jain on 23/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "myViewController2.h"

@interface myViewController2 ()
{
    UITextView *textView;
}
@end

@implementation myViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    textView = [[UITextView alloc]initWithFrame: CGRectMake(50, 50, 150, 150)];
    textView.backgroundColor= [UIColor lightGrayColor];
    [self.view addSubview:textView];
    
    
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
