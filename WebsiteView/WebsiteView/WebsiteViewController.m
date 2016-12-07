//
//  WebsiteViewController.m
//  WebsiteView
//
//  Created by Vaibhav Jain on 09/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "WebsiteViewController.h"

@interface WebsiteViewController ()

@property (strong, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation WebsiteViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)viewWillAppear:(BOOL)animated
{
   [super viewWillAppear: animated];
    
    self.webView.scalesPageToFit=YES;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://google.com"]]];
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
