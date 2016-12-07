//
//  ViewController.m
//  AppAuthExample
//
//  Created by Vaibhav Jain on 25/11/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//



//870795637718-tuq2tjfh43aqld891bfoqe6ch4dipgkj.apps.googleusercontent.com



//http://127.0.0.1:8000/accounts/google/login/callback/
//<string name="google_auth_redirect_uri" translatable="false">http://127.0.0.1:8000/accounts/google/login/callback/</string>
//
//<bool name="github_enabled">true</bool>
//<string name="github_client_id" translatable="false">002fc4e6fe1409c3bdca</string>
//<!--
//NOTE: This scheme is automatically provisioned by Google for Android OAuth2 clients, and is
//the reverse form of the client ID registered above. Handling of this scheme is registered in an
//intent filter in the app's manifest.
//-->
//<string name="github_auth_redirect_uri" translatable="false">http://192.168.1.96:8000/social/github/</string>
//<string name="github_auth_endpoint">https://github.com/login/oauth/authorize</string>
//<string name="github_token_endpoint">https://github.com/login/oauth/access_token</string>
//<string name="github_scope_string">user:email</string>

#import "ViewController.h"
#import "AppDelegate.h"
#import "OIDAuthorizationRequest.h"
#import "OIDServiceConfiguration.h"
#import "OIDAuthState.h"
#import "OIDAuthState+IOS.h"




@interface ViewController ()

@end

@implementation ViewController


UIButton *button;


//https://accounts.google.com/o/oauth2/v2/auth
//https://www.googleapis.com/oauth2/v4/token
//870795637718-tuq2tjfh43aqld891bfoqe6ch4dipgkj.apps.googleusercontent.com

-(void)performAction
{
   
    NSLog(@"Bif Boss");
    
    NSURL *authorizationEndpoint =
    [NSURL URLWithString:@"https://accounts.google.com/o/oauth2/v2/auth"];
    NSURL *tokenEndpoint =
        [NSURL URLWithString:@"https://www.googleapis.com/oauth2/v4/token"];
    
//    NSURL *authorizationEndpoint =
//    [NSURL URLWithString:@"https://github.com/login/oauth/authorize"];
//    NSURL *tokenEndpoint =
//    [NSURL URLWithString:@"https://github.com/login/oauth/access_token"];
    // client id : -  002fc4e6fe1409c3bdca
    // redirect url : - http://192.168.1.96:8000/social/github/

    
    
    
    OIDServiceConfiguration *configuration =
    [[OIDServiceConfiguration alloc]
     initWithAuthorizationEndpoint:authorizationEndpoint
     tokenEndpoint:tokenEndpoint];
    
    OIDAuthorizationRequest *request =
    [[OIDAuthorizationRequest alloc] initWithConfiguration:configuration
                                                  clientId:@"870795637718-tuq2tjfh43aqld891bfoqe6ch4dipgkj.apps.googleusercontent.com"
                                                    scopes:@[OIDScopeOpenID,
                                                             OIDScopeProfile]
                                               redirectURL:[NSURL URLWithString:@"com.googleusercontent.apps.870795637718-tuq2tjfh43aqld891bfoqe6ch4dipgkj:/oauthredirect"]
                                              responseType:OIDResponseTypeCode
                                      additionalParameters:nil];
    
    // performs authentication request
    AppDelegate *appDelegate =
    (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.currentAuthorizationFlow =
    [OIDAuthState authStateByPresentingAuthorizationRequest:request
                                   presentingViewController:self
                                                   callback:^(OIDAuthState *_Nullable authState,
                                                              NSError *_Nullable error) {
                                                       if (authState) {
                                                           NSLog(@"Got authorization tokens. Access token: %@",
                                                                 authState.lastTokenResponse.accessToken);
                                                           [self setAuthState:authState];
                                                       } else {
                                                           NSLog(@"Authorization error: %@", [error localizedDescription]);
                                                           [self setAuthState:nil];
                                                       }
                                                   }];
    
    [self.authState withFreshTokensPerformAction:^(NSString *_Nonnull accessToken,
                                                   NSString *_Nonnull idToken,
                                                   NSError *_Nullable error) {
    
        if (error) {
            NSLog(@"Error fetching fresh tokens: %@", [error localizedDescription]);
            return;
        }
        
        // perform your API request using the tokens
    }];

    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"ninja");
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(performAction)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Login" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    button.backgroundColor = [UIColor redColor];
    button.tintColor = [UIColor blueColor];
    
    [self.view addSubview:button];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
