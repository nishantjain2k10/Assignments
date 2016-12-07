//
//  ViewController.h
//  TableViewDemo
//
//  Created by Vaibhav Jain on 21/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource , UITableViewDelegate , UISearchBarDelegate,UISearchDisplayDelegate>
{
    UITableView *tableView;
    UISearchBar *searchBar;
    UISearchDisplayController *searchDisplayController;
}


@end

