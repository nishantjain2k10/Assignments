//
//  DetailViewController.h
//  AddressBook
//
//  Created by Vaibhav Jain on 06/10/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface DetailViewController : UIViewController <UITableViewDelegate , UITableViewDataSource,UIActionSheetDelegate , MFMessageComposeViewControllerDelegate>

@property (nonatomic, strong) NSDictionary *dictContactDetails;

//contain the data passed from the master view controller.

@property (weak, nonatomic) IBOutlet UIImageView *contactImage;
 
@property (weak, nonatomic) IBOutlet UILabel *contactName;

@property (weak, nonatomic) IBOutlet UITableView *contactDetails;

@end

