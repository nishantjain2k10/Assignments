//
//  ViewController.h
//  VideoCaptureDemo
//
//  Created by Vaibhav Jain on 26/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface ViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@property (strong, nonatomic) NSURL *videoURL;
@property (strong, nonatomic) MPMoviePlayerController *videoController;

-(IBAction)captureVideo:(id)sender;


@end

