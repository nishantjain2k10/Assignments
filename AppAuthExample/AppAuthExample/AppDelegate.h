//
//  AppDelegate.h
//  AppAuthExample
//
//  Created by Vaibhav Jain on 25/11/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OIDAuthorizationService.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// property of the app's AppDelegate
@property(nonatomic, strong, nullable)
id<OIDAuthorizationFlowSession> currentAuthorizationFlow;


@end

