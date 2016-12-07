//
//  RotatableViewController.m
//  PyshchologistDemo
//
//  Created by Vaibhav Jain on 08/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "RotatableViewController.h"

@interface RotatableViewController ()

@end

@implementation RotatableViewController


-(void)awakeFromNib
{
    [super awakeFromNib];
    self.splitViewController.delegate = self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(BOOL)splitViewController:(UISplitViewController *) svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    return NO;
}


-(void)splitViewController:(UISplitViewController *) svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title=self.title;
    //tell the detail view to put this buttonup
}

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // tell the detial viey to take the button away
}
-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
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
