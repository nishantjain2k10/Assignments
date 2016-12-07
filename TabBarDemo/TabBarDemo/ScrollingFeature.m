//
//  ScrollingFeature.m
//  App1ScrollView
//
//  Created by Vaibhav Jain on 21/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ScrollingFeature.h"

@interface ScrollingFeature()
{

    UIImageView *imageView;
    int h;
    
    
}
@property(nonatomic) NSTimer *scrollTimer;

@end


@implementation ScrollingFeature

-(void)setConstraints: (NSArray*)images NumberOfItemsPerPage:(int) numberOfItemsPerPage
{
    
    int counter=0;
    
    for (int i = 0; i < [images count]/numberOfItemsPerPage; i++)
    {
        CGFloat xOrigin = i * self.bounds.size.width;
       
        
        for(int i=0; (i<numberOfItemsPerPage);i++)
        {
            
            imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, self.bounds.origin.y, self.bounds.size.width/numberOfItemsPerPage, self.bounds.size.height)];
            NSLog(@"%@",[images objectAtIndex:counter]);
            [imageView setImage:[UIImage imageNamed:[images objectAtIndex:counter]]];
            counter++;
            NSLog(@"valus is %f",xOrigin);
            NSLog(@"valus is %d",counter);
            [imageView setContentMode:UIViewContentModeScaleToFill];
            xOrigin=xOrigin+(self.bounds.size.width/numberOfItemsPerPage);
            [self addSubview:imageView];

        }
    }
    
    [self setContentSize:CGSizeMake(self.bounds.size.width * ([images count]/numberOfItemsPerPage), self.bounds.size.height)];
      
}

- (void)timerFired
{
    
    CGFloat pageSize = self.bounds.size.width ;
    NSLog(@"size is %f",pageSize);
    NSLog(@"content offset is %f",self.contentOffset.x);
    
    // if this is the last page return
    if(self.contentOffset.x >= (self.contentSize.width-self.bounds.size.width))
    {
        [self setContentOffset:CGPointMake(0.0, self.contentOffset.y) animated:YES];
    }
    else
    {
        [self setContentOffset:CGPointMake(self.contentOffset.x + pageSize, self.contentOffset.y) animated:YES];
       
        
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
