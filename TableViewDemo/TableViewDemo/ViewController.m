//
//  ViewController.m
//  TableViewDemo
//
//  Created by Vaibhav Jain on 21/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    NSArray *array1;
    NSArray *array2;
    NSArray *array3;
}
@end

@implementation ViewController

//-- Assign data to cells


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier] ;
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    UIView *selectedView = [[UIView alloc]init];
    selectedView.backgroundColor = [UIColor redColor];
    cell.selectedBackgroundView =  selectedView;
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    
    if (indexPath.section==0) {
        
        cell.textLabel.text = @"Hello1";
    }
    else if(indexPath.section == 1)
    {
        
        cell.textLabel.text = @"Hello2";

    }
    else
    {
         cell.textLabel.text = @"Hello3";
        
    }
   
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Good" message:@"teramatrix is superb" preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                               }];
    
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section ==0)
    {
        return 3;// [array1 count];
    }
    else if(section ==1)
    {
        return  4;// [array2 count];
    }
    else
    {
        return 5;//[array3 count];
    }
        
}
-

(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

//-- Table header height if needed



//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    if(indexPath.section==0)
//    {
//        if(indexPath.row ==0)
//            return 10;
//        else
//            return 20;
//    }
//    else if (indexPath.section==1)
//    {
//        if(indexPath.row==0)
//            return 20;
//        else
//            return 10;
//    }
//    else
//        return 20;
//}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section ==0)
    {
        return 50;
    }
    else if (section==1)
    {
        return 40;
    }
    else
    {
        return  30;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section ==0)
        return 30;
    else
        return 0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section ==0)
    {
        return @"Section1";
    }
    else if (section==1)
    {
        return @"Section2";
    }
    else
    {
        return @"Section3";
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if(section ==0)
    {
        return @"Footer1";
    }
    else if (section==1)
    {
        return @"Footer2";
    }
    else
    {
        return @"Footer3";
    }
}


- (void)viewDidLoad {   
    [super viewDidLoad];
    tableView=[[UITableView alloc]init];
    tableView.frame = CGRectMake(10,30,self.view.bounds.size.width,self.view.bounds.size.height);
    tableView.dataSource=self;
    tableView.delegate=self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [tableView reloadData];
    [self.view addSubview:tableView];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDisplayController.delegate = self;
    searchDisplayController.searchResultsDataSource = self;
    tableView.tableHeaderView=searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
