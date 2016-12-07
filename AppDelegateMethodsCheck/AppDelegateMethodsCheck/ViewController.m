//
//  ViewController.m
//  AppDelegateMethodsCheck
//
//  Created by Vaibhav Jain on 26/08/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


-(IBAction) parseJson;

@end

@implementation ViewController



-(void)addNavigationBarButton{
    
    
    
//    UIBarButtonItem *myNavBtn = [[UIBarButtonItem alloc] initWithTitle:
//                                 @"MyButton" style:UIBarButtonItemStyleBordered target:
//                                 self action:@selector(myButtonClicked:)];
//    
//    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
//    [self.navigationItem setTitle:@"Hello World!"];
//    [self.navigationItem setRightBarButtonItem:myNavBtn];
    
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    
    //Set title if needed
    UINavigationItem * navTitle = [[UINavigationItem alloc] init];
    navTitle.title = @"Title";
    
    //Here you create info button and customize it
    UIButton * tempButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    
    //Add selector to info button
    [tempButton addTarget:self action:@selector(infoButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * infoButton = [[UIBarButtonItem alloc] initWithCustomView:tempButton];
    
    //In this case your button will be on the right side
    navTitle.rightBarButtonItem = infoButton;
    
    //Add NavigationBar on main view
    navBar.items = @[navTitle];
    [self.view addSubview:navBar];
    
}






-(IBAction) parseJson

{
    

//    NSData *allCoursesData = [[NSData alloc] initWithContentsOfURL:
//                              [NSURL URLWithString:@"https://api.myjson.com/bins/1f36h"]];
    
    NSData *allCoursesData = [[NSData alloc] initWithContentsOfURL:
                              [NSURL URLWithString:@"https://api.myjson.com/bins/2wvwp"]];
    
    

    
    
    NSError *error;
    NSMutableDictionary *allCourses = [NSJSONSerialization
                                       JSONObjectWithData:allCoursesData
                                       options:NSJSONReadingMutableContainers| NSJSONReadingMutableLeaves
                                       error:&error];
    
    
    //NSError *error;
    //NSDictionary *allCourses = [NSJSONSerialization
    //                            JSONObjectWithData:allCoursesData
    //                            options:kNilOptions
    //                            error:&error];
    
    
    if([allCourses count] ==0 )
    {
        NSLog(@"Nothing in this parsed json");
    }
    else
    {
        NSLog(@"count : %lu",(unsigned long)[allCourses count]);

    }
    
    //allCourses[@"Monday"]
    
    if(error)
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        NSArray *monday = allCourses[@"cast"];
        for ( NSDictionary *theCourse in monday )
        {
            NSLog(@"----");
            NSLog(@"Title: %@", theCourse[@"name"] );
            NSLog(@"Speaker: %@", theCourse[@"character"] );
             NSLog(@"----");
        }
    }
    

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"view did load ");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"did receive memory");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"view did Appear");
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"view did disappear");
}




 


@end