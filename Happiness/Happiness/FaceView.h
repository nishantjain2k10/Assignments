//
//  FaceView.h
//  Happiness
//
//  Created by Vaibhav Jain on 06/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceView;

@protocol FaceViewDataSource  <NSObject>

-(float)smileForFaceView :(FaceView *)sender;

@end


@interface FaceView : UIView

@property (nonatomic) CGFloat scale;
@property (nonatomic) CGFloat sc;

-(void)pinch:(UIPinchGestureRecognizer *) gesture;

@property(nonatomic,weak) id <FaceViewDataSource> dataSource;


@end
