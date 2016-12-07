//
//  ViewController.m
//  VideoCaptureDemo
//
//  Created by Vaibhav Jain on 26/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


{
    UIButton *capture;
}
@end

@implementation ViewController


-(IBAction)captureVideo:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie,nil];
    
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    self.videoURL = info[UIImagePickerControllerMediaURL];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    self.videoController = [[MPMoviePlayerController alloc] init];
    
    [self.videoController setContentURL:self.videoURL];
    [self.videoController.view setFrame:CGRectMake (0, 0, self.view.bounds.size.width, self.view.bounds.size.height-200)];
    [self.view addSubview:self.videoController.view];
    
    //add notification
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(videoPlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.videoController];
    
    [self.videoController play];
    
}

- (void)videoPlayBackDidFinish:(NSNotification *)notification {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    // Stop the video player and remove it from view
    [self.videoController stop];
    [self.videoController.view removeFromSuperview];
    self.videoController = nil;
    
    // Display a message
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Video Playback" message:@"Just finished the video playback. The video is now removed." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [self dismissViewControllerAnimated:alertView completion:nil];
    }];
    [alertView addAction:ok];
    [self presentViewController:alertView animated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    capture = [[UIButton alloc]initWithFrame:CGRectMake(150, self.view.bounds.size.height-150 , self.view.bounds.size.width-2*150, 50)];
    [capture setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [capture setTitle:@"CapTure" forState:UIControlStateNormal];
    capture.layer.cornerRadius=10;
    capture.clipsToBounds=YES;
    [capture setBackgroundColor:[UIColor whiteColor]];
    [capture addTarget:self action:@selector(captureVideo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:capture];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
