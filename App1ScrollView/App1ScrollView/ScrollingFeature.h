//
//  ScrollingFeature.h
//  App1ScrollView
//
//  Created by Vaibhav Jain on 21/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollingFeature : UIScrollView <UIScrollViewDelegate>


 

-(void)setConstraints: (NSArray*)images NumberOfItemsPerPage:(int) numberOfItemsPerPage;
- (void)timerFired;


@end
