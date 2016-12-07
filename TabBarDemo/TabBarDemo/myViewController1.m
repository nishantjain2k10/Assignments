//
//  myViewController1.m
//  TabBarDemo
//
//  Created by Vaibhav Jain on 23/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "myViewController1.h"

@interface myViewController1 ()

@end

@implementation myViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor blueColor];
    UIButton *button1;
    button1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, self.view.bounds.size.width/2, self.view.bounds.size.height/4)];
    button1.backgroundColor=[UIColor lightGrayColor];
    
    [self.view addSubview:button1];

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
