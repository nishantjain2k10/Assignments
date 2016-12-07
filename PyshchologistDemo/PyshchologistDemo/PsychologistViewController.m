//
//  PsychologistViewController.m
//  PyshchologistDemo
//
//  Created by Vaibhav Jain on 08/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "PsychologistViewController.h"
#import "HappinessViewController.h"

@interface PsychologistViewController ()


@property(nonatomic) int diagnosis;

@end

@implementation PsychologistViewController


- (HappinessViewController *) splitViewHappinessViewController
{
    id hvc = [self.splitViewController.viewControllers lastObject];
    if(![hvc isKindOfClass: [HappinessViewController class]])
    {
        hvc = nil;
    }
    return  hvc;
}

-(void)perform:(int)value
{
    self.diagnosis=value;
    if( [self splitViewHappinessViewController])
    {
        [self splitViewHappinessViewController].happiness = self.diagnosis;
    }
    else
    {
         [self performSegueWithIdentifier: @"diagnosis" sender:self];
    }
    
   
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"diagnosis"])
    {
        [segue.destinationViewController setHappiness:self.diagnosis];
    }
    else if([segue.identifier isEqualToString:@"diagnosis1"])
    {
        [segue.destinationViewController  setHappiness:100];
    }
    else if([segue.identifier isEqualToString:@"diagnosis2"])
    {
        [segue.destinationViewController setHappiness:20];
    }
    
    else if([segue.identifier isEqualToString:@"diagnosis3"])
    {
        [segue.destinationViewController setHappiness:80];
    }
    
    
}


- (IBAction)less
{
    
    [self perform:20];
}

- (IBAction)medium {
    [self perform:50];
    
}
- (IBAction)high {
    
    [self perform:100];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
