//
//  ViewController.h
//  AppAuthExample
//
//  Created by Vaibhav Jain on 25/11/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OIDAuthState.h"
#import "OIDTokenResponse.h"

@interface ViewController : UIViewController


// property of the containing class
@property(nonatomic, strong, nullable) OIDAuthState *authState;

@end

