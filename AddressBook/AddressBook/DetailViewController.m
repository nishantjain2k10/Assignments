
//  DetailViewController.m
//  AddressBook
//
//  Created by Vaibhav Jain on 06/10/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

-(void)populateContactData;

-(void)performPhoneAction:(BOOL)shouldMakeCall;
-(void)makeCallToNumber:(NSString *)numberToCall;
-(void)sendSMSToNumber:(NSString *)numberToSend;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [_contactDetails setDelegate: self];
    [_contactDetails setDataSource:self];
    [self populateContactData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - action sheet delegate methods


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex != 3) {
        NSString *selectedPhoneNumber = [actionSheet buttonTitleAtIndex:buttonIndex];
        
        if ([actionSheet tag] == 101) {
            [self makeCallToNumber:selectedPhoneNumber];
        }
        else{
            [self sendSMSToNumber:selectedPhoneNumber];
        }
    }
}

#pragma mark - implement private methods


-(void)performPhoneAction:(BOOL)shouldMakeCall{
    if (![[_dictContactDetails objectForKey:@"mobileNumber"] isEqualToString:@""] &&
        ![[_dictContactDetails objectForKey:@"homeNumber"] isEqualToString:@""])
    {
        UIActionSheet *phoneOptions = [[UIActionSheet alloc] initWithTitle:@"Pick a number"
                                                                  delegate:self
                                                         cancelButtonTitle:@"Cancel"
                                                    destructiveButtonTitle:@""
                                                         otherButtonTitles:[_dictContactDetails objectForKey:@"mobileNumber"], [_dictContactDetails objectForKey:@"homeNumber"], nil];
        [phoneOptions showInView:self.view];
        
        if (shouldMakeCall) {
            [phoneOptions setTag:101];
        }
        else{
            [phoneOptions setTag:102];
        }
        
    }
    else{
        NSString *selectedPhoneNumber = nil;
        
        if (![[_dictContactDetails objectForKey:@"mobileNumber"] isEqualToString:@""]) {
            selectedPhoneNumber = [_dictContactDetails objectForKey:@"mobileNumber"];
            
        }
        
        if (![[_dictContactDetails objectForKey:@"homeNumber"] isEqualToString:@""]) {
            selectedPhoneNumber = [_dictContactDetails objectForKey:@"homeNumber"];
        }
        
        
        if (selectedPhoneNumber != nil) {
            if (shouldMakeCall) {
                [self makeCallToNumber:selectedPhoneNumber];
            }
            else{
                [self sendSMSToNumber:selectedPhoneNumber];
            }
            
        }
    }
}


-(void)makeCallToNumber:(NSString *)numberToCall{
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", numberToCall]];
    if ([[UIApplication sharedApplication] canOpenURL:phoneURL]) {
        [[UIApplication sharedApplication] openURL:phoneURL];
    }
}



-(void)sendSMSToNumber:(NSString *)numberToSend{
    if (![MFMessageComposeViewController canSendText]) {
        NSLog(@"Unable to send SMS message.");
    }
    else {
        MFMessageComposeViewController *sms = [[MFMessageComposeViewController alloc] init];
        [sms setMessageComposeDelegate:self];
        
        [sms setRecipients:[NSArray arrayWithObjects:numberToSend, nil]];
        [sms setBody:@"This is a SMS message from Appcoda.com"];
        [self presentViewController:sms animated:YES completion:nil];
    }
}



-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - implement action methods









-(IBAction)makeCall:(id)sender
{
    [self performPhoneAction:YES];
}
-(IBAction)sendSMS:(id)sender
{
    [self performPhoneAction:NO];
}



#pragma mark -  populate data to view



-(void)populateContactData
{
    NSString *contactFullName = [NSString stringWithFormat:@"%@ %@", [_dictContactDetails objectForKey:@"firstName"], [_dictContactDetails objectForKey:@"lastName"]];
    
    
    self.contactName.text=contactFullName;
    //[_contactName setText:contactFullName];
    
    [self.contactName setText:contactFullName];
    NSLog(@"Contact full name is %@",contactFullName);
    // Set the contact image.
    NSLog(@"image is %@",[_dictContactDetails objectForKey:@"image"]);
    if ([_dictContactDetails objectForKey:@"image"] != nil) {
        [_contactImage setImage:[UIImage imageWithData:[_dictContactDetails objectForKey:@"image"]]];
    }
    else
    {
        [_contactImage setImage:[UIImage imageNamed:@"qr.png"]];
    }
    
    NSLog(@"image displayed is %@",_contactImage.image);
    [_contactDetails reloadData];
}


#pragma mark -  table view delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        return 2;
    }
    else{
        return 3;
    }
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Phone Numbers";
            break;
        case 1:
            return @"E-mail Addresses";
            break;
        case 2:
            return @"Address Info";
            break;
            
        default:
            return @"";
            break;
    }
}



#pragma mark -  table view data source  methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    NSString *cellText = @"";
    NSString *detailText = @"";
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cellText = [_dictContactDetails objectForKey:@"mobileNumber"];
                    detailText = @"Mobile Number";
                    break;
                case 1:
                    cellText = [_dictContactDetails objectForKey:@"homeNumber"];
                    detailText = @"Home Number";
                    break;
            }
            break;
            
        case 1:
            switch (indexPath.row) {
                case 0:
                    cellText = [_dictContactDetails objectForKey:@"homeEmail"];
                    detailText = @"Home E-mail";
                    break;
                case 1:
                    cellText = [_dictContactDetails objectForKey:@"workEmail"];
                    detailText = @"Work E-mail";
                    break;
            }
            break;
            
        case 2:
            switch (indexPath.row) {
                case 0:
                    cellText = [_dictContactDetails objectForKey:@"address"];
                    detailText = @"Street Address";
                    break;
                case 1:
                    cellText = [_dictContactDetails objectForKey:@"zipCode"];
                    detailText = @"ZIP Code";
                    break;
                case 2:
                    cellText = [_dictContactDetails objectForKey:@"city"];
                    detailText = @"City";
                    break;
            }
            break;
            
        default:
            break;
    }
    
    cell.textLabel.text = cellText;
    cell.detailTextLabel.text = detailText;
    
    return cell;
}

@end
