//
//  ViewController.m
//  ImagePickerDemo
//
//  Created by Vaibhav Jain on 26/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

{
    UIButton *takePhoto;
    UIButton *selectPhoto;
}

@end

@implementation ViewController


-(IBAction)takePhoto:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
   
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"No Camera Avalible" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [self dismissViewControllerAnimated:alertView completion:nil];
        }];
        [alertView addAction:ok];
        [self presentViewController:alertView animated:YES completion:nil];
    }
    else{
         picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }

    
    [self presentViewController:picker animated:YES completion:NULL];
}

-(IBAction)selectPhoto:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}


//delegate method , need one more parameter to pass if more than oen picker to specify picker name
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor lightGrayColor];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/2)];
    self.imageView.image= [UIImage imageNamed:@"nj.jpg"];
    takePhoto = [[UIButton alloc]initWithFrame:CGRectMake(150, self.view.bounds.size.height/2+100, self.view.bounds.size.width-2*150, 50)];
    selectPhoto= [[UIButton alloc]initWithFrame:CGRectMake(150, self.view.bounds.size.height/2+200, self.view.bounds.size.width-2*150, 50)];
    
    
    [takePhoto setTitle:@"Take Photo" forState:UIControlStateNormal];
    [takePhoto setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [takePhoto setBackgroundColor: [UIColor whiteColor]];
    takePhoto.layer.cornerRadius = 10;
    takePhoto.clipsToBounds=YES;
    [takePhoto addTarget:self action:@selector(takePhoto:) forControlEvents:UIControlEventTouchUpInside];
    
    [selectPhoto setTitle:@"Select Photo" forState:UIControlStateNormal];
    [selectPhoto setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [selectPhoto setBackgroundColor:[UIColor whiteColor]];
    selectPhoto.layer.cornerRadius = 10;
    selectPhoto.clipsToBounds=YES;
    [selectPhoto addTarget: self action:@selector(selectPhoto:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:takePhoto];
    [self.view addSubview:selectPhoto];
    
    

    
    
    
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
