//
//  ScrollingFeature.m
//  App1ScrollView
//
//  Created by Vaibhav Jain on 21/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ScrollingFeature.h"
#import "ViewController.h"

@interface ScrollingFeature()
{

    UIImageView *imageView;
    UILabel *question;
    UILabel *answerOfQuestion;
    int h;
    ViewController *view;
    UIColor *textColor;
    
    
}
@property(nonatomic) NSTimer *scrollTimer;

@end


@implementation ScrollingFeature



//-(UIImage *) getImageFromURL:(NSString *)fileURL {
//    UIImage * result;
//    
//    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
//    result = [UIImage imageWithData:data];
//    
//    return result;
//}
//



-(void)setTextColor:(UIColor*)color
{
    textColor=color;
}

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
            
            NSString *url = [NSString stringWithFormat: @"http://%@",[images objectAtIndex:counter]];
            
//            //Definitions
//            NSString * documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//            
//            //Get Image From URL
//            UIImage * imageFromURL = [self.getImageFromURL:url];
//            
//            //Save Image to Directory
//            [self saveImage:imageFromURL withFileName:@"My Image" ofType:@"png" inDirectory:documentsDirectoryPath];
//            
//            //Load Image From Directory
//            UIImage * imageFromWeb = [self loadImage:@"My Image" ofType:@"png" inDirectory:documentsDirectoryPath];
//            
            
            
            //[imageView setImage:[UIImage imageWithData: [NSData dataWithContentsOfURL:[NSURL URLWithString:url]]]];
            
            
            NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
            UIImage *myimage = [[UIImage alloc] initWithData:mydata];
            [imageView setImage:myimage];
            
            //imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
            
           // [imageView setImage:[UIImage imageNamed: [images objectAtIndex:counter]]];
            NSLog(@"Image name is %@",[images objectAtIndex:counter]);
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


-(void)setConstraintsForText: (NSArray*)answers
{
    view = [[ViewController alloc]init];
    
    for(int i=0;i<answers.count;i++)
    {
        CGFloat xOrigin = i * self.bounds.size.width;
        NSDictionary *answer = [answers objectAtIndex:i];
        NSString *Answer = [answer objectForKey:@"Answer"];
        NSString *Question = [answer objectForKey:@"Question"];
        NSString *questionString = [Question stringByReplacingOccurrencesOfString:@"`" withString:@" "];
//
//        for(int i=0;i<Question.length;i++)
//        {
//            if([questionString characterAtIndex:i] == '`')
//            {
//                
//                [Question stringByReplacingOccurrencesOfString:@"`" withString:@" "];
//                break;
//            }
//        }

        
        question = [[UILabel alloc]initWithFrame:CGRectMake(xOrigin, self.bounds.origin.y,self.bounds.size.width, self.bounds.size.height/3)];
        answerOfQuestion= [[UILabel alloc]initWithFrame:CGRectMake(xOrigin, self.bounds.size.height/2, self.bounds.size.width, self.bounds.size.height/3)];
        question.text=questionString;
        UIFont *customFont = [UIFont fontWithName:@"Oswald-Light" size:40];
        question.font=customFont;
        question.numberOfLines=0;
        question.adjustsFontSizeToFitWidth=YES;
//        question.textColor=view.makeColor;
//        NSLog(@"Color in scroll view fature is %@",view.makeColor);
        question.textColor=textColor;
        question.textAlignment = NSTextAlignmentCenter;

        answerOfQuestion.text=Answer;
        answerOfQuestion.font=customFont;
        answerOfQuestion.numberOfLines=0;
        answerOfQuestion.adjustsFontSizeToFitWidth=YES;
        answerOfQuestion.textColor=textColor;
        answerOfQuestion.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:question];
        [self addSubview:answerOfQuestion];
        
    }
    
    
    
    [self setContentSize:CGSizeMake(self.bounds.size.width * [answers count] , self.bounds.size.height)];
    
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
