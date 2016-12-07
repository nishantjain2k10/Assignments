//
//  ViewController.h
//  ImagePickerDemo
//
//  Created by Vaibhav Jain on 26/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate , UINavigationControllerDelegate>


@property(nonatomic,strong) UIImageView *imageView;

-(IBAction) takePhoto:(id)sender;
-(IBAction) selectPhoto:(id)sender;

@end

