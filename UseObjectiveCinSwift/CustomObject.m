//
//  CustomObject.m
//  UseObjectiveCinSwift
//
//  Created by Vaibhav Jain on 21/10/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "CustomObject.h"
#import "UseObjectiveCinSwift-Swift.h"



@implementation CustomObject





- (void) someMethod {
    NSLog(@"SomeMethod Ran");
    
    MySwiftObject * myOb = [MySwiftObject new];
    NSLog(@"MyOb.someProperty: %@", myOb.someProperty);
    myOb.someProperty = @"Hello World";
    NSLog(@"MyOb.someProperty: %@", myOb.someProperty);
    NSString * retString = [myOb someFunction:@"Arg"];
    NSLog(@"RetString: %@", retString);
}

@end
