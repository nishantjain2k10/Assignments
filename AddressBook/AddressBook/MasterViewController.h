//
//  MasterViewController.h
//  AddressBook
//
//  Created by Vaibhav Jain on 06/10/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

//@class DetailViewController;

@interface MasterViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate , UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
//@property (strong, nonatomic) DetailViewController *detailViewController;
@property (nonatomic, strong) NSMutableArray *arrContactsData;


@end

