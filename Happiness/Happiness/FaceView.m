//
//  FaceView.m
//  Happiness
//
//  Created by Vaibhav Jain on 06/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "FaceView.h"

@interface FaceView()

@end

@implementation FaceView

#define  DEFAULT_SCALE 0.90

-(void)pinch:(UIPinchGestureRecognizer *) gesture
{
    if((gesture.state == UIGestureRecognizerStateEnded) || (gesture.state == UIGestureRecognizerStateChanged))
    {
        self.scale *=  gesture.scale;
        gesture.scale=1;
    }
}


-(CGFloat) scale
{
    if(!self.scale)
    {
        return DEFAULT_SCALE;
        
    }
    else{
        return self.scale ;
    }
}

- (void)setScale:(CGFloat)scale
{
    _ = scale;
}

- (void)setSc:(CGFloat)sc
{
    _sc = sc;
}

-(void)setScale:(CGFloat)scale
{
    if(scale != self.scale )
    {
        [self setNeedsDisplay];
    }
}


//-(id) initWithFrame:(CGRect)frame
//{
//    
//    //self = [super initWithFrame:<#frame#>];
//    self = [super init];
//    if(self)
//    {
//        
//
//    }
//    return self;
//}





//- (id)initWithCoder:(NSCoder *)aCoder
//{
//    self = [super initWithCoder:aCoder];
//    
//    if(self)
//    {
//        
//    }
//    return self;
//}


-(void) drawCircleAtPoint:(CGPoint)p withRadius:(CGFloat)radius inContext:(CGContextRef)context
{
    NSLog(@"circle created");
    UIGraphicsPushContext(context);
     NSLog(@"radius is %g " , radius);
    CGContextBeginPath(context);
    CGContextAddArc(context, p.x,  p.y, radius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    UIGraphicsPopContext();
}




- (void)drawRect:(CGRect)rect
{
    NSLog(@"Execution started");
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint midPoint;
    
    midPoint.x = self.bounds.origin.x + self.bounds.size.width/2;
    midPoint.y = self.bounds.origin.y + self.bounds.size.height/2;
    
    CGFloat size = self.bounds.size.width/2;
    if(self.bounds.size.height < self.bounds.size.width)
    {
        size = self.bounds.size.height/2;
    }
    
    NSLog(@"mid point is %g  %g" , midPoint.x ,midPoint.y);
    

    size *= self.scale;
    
    CGContextSetLineWidth(context , 5.0);
    [[UIColor blueColor] setStroke];
    [self drawCircleAtPoint:midPoint withRadius: size inContext:context];
    
    
    #define  EYE_H 0.35
    #define  EYE_V  0.35
    #define  EYE_RADIUS 0.10
    
    CGPoint eyePoint;
    eyePoint.x = midPoint.x - size *EYE_H;
    eyePoint.y = midPoint.y - size *EYE_V;
    
    [self drawCircleAtPoint:eyePoint withRadius:EYE_RADIUS*size inContext:context];
    eyePoint.x += size*EYE_H*2;
    [self drawCircleAtPoint: eyePoint withRadius:size*EYE_RADIUS inContext:context];
    
    
    #define  MOUTH_H 0.45
    #define  MOUTH_V  0.40
    #define  MOUTH_SMILE 0.25
    
    CGPoint mouthStart;
    CGPoint mouthEnd;
    
    mouthStart.x= midPoint.x - MOUTH_H*size;
    mouthStart.y = midPoint.y + MOUTH_V*size;
    mouthEnd = mouthStart;
    mouthEnd.x += MOUTH_H*size*2;
    CGPoint mouthCP1 , mouthCP2;
    mouthCP1=mouthStart;
    mouthCP2=mouthEnd;
    mouthCP1.x += MOUTH_H*size*2/3;
    mouthCP2.x -= MOUTH_H*size*2/3;
    
    
   // float smile =-1;
    float smile = [self.dataSource smileForFaceView:self];
    
    if(smile < -1)
        smile=-1;
    if(smile>1)
        smile=1;
    CGFloat smileOffset = MOUTH_SMILE*size*smile;
    mouthCP1.y += smileOffset;
    mouthCP2.y += smileOffset;
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, mouthStart.x, mouthStart.y);
    CGContextAddCurveToPoint(context, mouthCP1.x, mouthCP2.y, mouthCP2.x, mouthCP2.y, mouthEnd.x, mouthEnd.y);
    CGContextStrokePath(context);
    
    
    
    
    // draw face (circle)
    //draw eyes 2 (circle)
    // no eyes
    // mouth
    

}


@end
