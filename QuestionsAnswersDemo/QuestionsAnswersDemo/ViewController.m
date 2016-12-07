//
//  ViewController.m
//  QuestionsAnswersDemo
//
//  Created by Vaibhav Jain on 28/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ScrollingFeature.h"

 



@interface ViewController ()
{
    ScrollingFeature *scrollView;
    
    NSTimer *scrollTimer;
    UILabel *questionLabel;
    UILabel *fixLabel;
    UITextField *answer;
    UIButton *submit;
    NSMutableDictionary *all;
    NSError *requestError;
    NSString *fixString;
    UIButton *skip;
    UIButton *showAnswers;
    UIButton *showPosters;
    UIButton *submitQuestion;
    UIButton *submitQuestionToApi;
    
    
    UIView *popupView;
    UITextField *questionTest;


}

@end

@implementation ViewController



-(UIColor*)colorWithHexString:(NSString*)hexStr
{
    NSString *hex = [hexStr substringFromIndex:1];
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;   
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

-(IBAction) parseJson: (UIButton *) sender

{
    
//    NSURL *url = [NSURL URLWithString:@"http://api.whatsyourexcuse.co/wye/excuseme"];
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    
//    // Configure the session here.
//    
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
//    
//    [[session dataTaskWithURL:url
//            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
//    {
//        // The response object contains the metadata (HTTP headers, status code)
//        
//        // The data object contains the response body
//        
//        // The error object contains any client-side errors (e.g. connection
//        // failures) and, in some cases, may report server-side errors.
//        // In general, however, you should detect server-side errors by
//        // checking the HTTP status code in the response object.
//        
//        
//        NSLog(@"Response is %@", response);
//        if(data == nil)
//            NSLog(@"Data is nil");
//        if(data != nil && error == nil)
//        {
//            all = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves | NSJSONReadingMutableLeaves error:&error];
//        }
//        
//    }] resume];
    
    
    
    
    
    
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.whatsyourexcuse.co/wye/excuseme"]];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    all = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves | NSJSONReadingMutableLeaves error:&error];

    
    NSLog(@"Count is %lu",(unsigned long)all.count);
    NSLog(@"BG color is %@",all[@"bgcolor"]);
    [self.view setBackgroundColor: [self colorWithHexString:all[@"bgcolor"]]];
    NSArray *RGB = all[@"textcolor"];
    //NSArray* RGB = [all objectForKey:@"textcolor"];
    
    CGFloat red =  [[RGB objectAtIndex:0] floatValue];
    CGFloat green =  [[RGB objectAtIndex:1] floatValue];
    CGFloat blue =  [[RGB objectAtIndex:2] floatValue];
    NSLog(@"Red is %f",red);
    NSLog(@"Green is %f",green);
    NSLog(@"Blue is %f",blue);
    self.makeColor = [UIColor colorWithRed: red/255.0f green: green/255.0f blue: blue/255.0f alpha:1];
    NSLog(@"Color is %@",self.makeColor);
    NSDictionary *question = [all objectForKey:@"question"];
    NSString *questionString = question[@"question"];
    int id = [question[@"id"] intValue];
    
    
    
    
    NSString *varyString;
    for(int i=0;i<questionString.length;i++)
    {
        if([questionString characterAtIndex:i] == '`')
        {
            fixString = [questionString substringToIndex:i];
            varyString = [questionString substringWithRange:NSMakeRange(i+1, questionString.length-(i+1))];
            break;
        }
    }

    
    fixLabel.text = fixString;
    questionLabel.text=varyString;
    [fixLabel setTextColor:self.makeColor];
    [questionLabel setTextColor:self.makeColor];
    [answer.layer setBorderColor: self.makeColor.CGColor];
    [answer setTextColor: self.makeColor];
    [submit setTitleColor:self.makeColor forState:UIControlStateNormal];
    [submit.layer setBorderColor:self.makeColor.CGColor];
    
    [skip setTitleColor:self.makeColor forState:UIControlStateNormal];
    [skip.layer setBorderColor:self.makeColor.CGColor];
    

    if([sender.currentTitle  isEqualToString: @"SUBMIT"])
    {
     
        
        NSString *urlString = [NSString stringWithFormat:@"http://api.whatsyourexcuse.co/wye/excuseme/%d",id];
        NSLog(@"URl is %@",urlString);
        
        // Create the request.
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        
        // Specify that it will be a POST request
        request.HTTPMethod = @"POST";
        
        
        NSDictionary *postData = [[NSDictionary alloc] initWithObjectsAndKeys:
                                 answer.text, @"answer",nil];
        
        NSError *postError;
        
        NSData *postdataJson = [NSJSONSerialization dataWithJSONObject:postData options:0  error:&postError];
        [request setHTTPBody:postdataJson];
        
            // This is how we set header fields
            [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        
        
        // Create url connection and fire request
        //NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        NSURLResponse *postResponse;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                              returningResponse:&postResponse
                                                          error:&postError];
        NSLog(@"Response is %@",postResponse);
        if(data != nil)
            NSLog(@"Succesfully done");
        
//        all = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves | NSJSONReadingMutableLeaves error:&postError];
//        NSLog(@"Count for post is %lu",(unsigned long)all.count);
        
        
    }
    
    
    
    
    
    answer.text=@"";
    
    
    
    
    }
    
    


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSURL *url = [NSURL URLWithString:@"http://api.whatsyourexcuse.co/wye/excuseme"];
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    
//    // Configure the session here.
//    
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
//    
//    [[session dataTaskWithURL:url
//            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
//      {
//          // The response object contains the metadata (HTTP headers, status code)
//          
//          // The data object contains the response body
//          
//          // The error object contains any client-side errors (e.g. connection
//          // failures) and, in some cases, may report server-side errors.
//          // In general, however, you should detect server-side errors by
//          // checking the HTTP status code in the response object.
//          
//          
//          //NSLog(@"Response is %@", response);
//          if(data == nil)
//              NSLog(@"Data is nil");
//          if(data != nil && error == nil)
//          {
//              NSLog(@"Data is not nil");
//
//              all = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves | NSJSONReadingMutableLeaves error:&error];
//              NSLog(@"number of keys are : %lu",(unsigned long)all.count);
//          }
//          
//      }] resume];
    
    
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.whatsyourexcuse.co/wye/excuseme"]];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    all = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves | NSJSONReadingMutableLeaves error:&error];
    
    
    NSLog(@"Count is %lu",(unsigned long)all.count);
    NSLog(@"BG color is %@",all[@"bgcolor"]);
    [self.view setBackgroundColor: [self colorWithHexString:all[@"bgcolor"]]];
    NSArray* RGB = [all objectForKey:@"textcolor"];
    
    CGFloat red =  [[RGB objectAtIndex:0] floatValue];
    CGFloat green =  [[RGB objectAtIndex:1] floatValue];
    CGFloat blue =  [[RGB objectAtIndex:2] floatValue];
    NSLog(@"Red is %f",red);
    NSLog(@"Green is %f",green);
    NSLog(@"Blue is %f",blue);
    self.makeColor = [UIColor colorWithRed: red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    NSLog(@"Color is %@",self.makeColor);
    
    NSDictionary *question = [all objectForKey:@"question"];
    NSString *questionString = question[@"question"];
    
    
//    if(questionString !=  nil)
//    {
//        NSMutableAttributedString *attributedString =
//        [[NSMutableAttributedString alloc]
//         initWithString:questionString];
//        
//        
//        
//        
//        [attributedString addAttribute: NSFontAttributeName
//                                 value:  [UIFont fontWithName:@"Oswald-Bold" size:80]
//                                 range: NSMakeRange(0,19)];
//        
//        [attributedString addAttribute: NSFontAttributeName
//                                 value:  [UIFont fontWithName:@"Oswald-Bold" size:40]
//                                 range: NSMakeRange(19,questionString.length-19)];
//        
//        
//        
//        questionLabel.attributedText = attributedString;
//    }
    
    
    
    
        
    NSString *varyString;
    for(int i=0;i<questionString.length;i++)
        {
            if([questionString characterAtIndex:i] == '`')
            {
                fixString = [questionString substringToIndex:i];
                varyString = [questionString substringWithRange:NSMakeRange(i+1, questionString.length-(i+1))];
                break;
            }
        }
    
    
   
    fixLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, self.view.bounds.size.width-2*50,150)];
    fixLabel.text =fixString;
    UIFont *fixCustomFont = [UIFont fontWithName:@"Oswald-Light" size:90];
    fixLabel.font=fixCustomFont;
    fixLabel.numberOfLines=0;
    fixLabel.adjustsFontSizeToFitWidth=YES;
    fixLabel.textColor= self.makeColor;
    fixLabel.textAlignment = NSTextAlignmentCenter;
    
    
    questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 200,self.view.bounds.size.width-2*50, 100)];
    questionLabel.text = varyString;
    questionLabel.textColor= self.makeColor;
    UIFont *customFont = [UIFont fontWithName:@"Oswald-Light" size:40];
    questionLabel.font = customFont;
    questionLabel.numberOfLines=0;
    questionLabel.adjustsFontSizeToFitWidth= YES;
    questionLabel.textAlignment = NSTextAlignmentCenter;
                             
    
    
    
    answer=[[UITextField alloc]initWithFrame:CGRectMake(40, 350,self.view.bounds.size.width-2*40 , 40)];
          
    
    answer.layer.borderWidth=1;
    
    answer.layer.borderColor = self.makeColor.CGColor;
    answer.textColor= self.makeColor;
   

    
    submit=[[UIButton alloc]initWithFrame: CGRectMake(90, 410, 100, 40)];
    [submit setTitle:@"SUBMIT" forState:UIControlStateNormal];
    [submit addTarget:self action:@selector(parseJson:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    submit.layer.borderColor = self.makeColor.CGColor;
    submit.layer.borderWidth=1;
    [submit setTitleColor: self.makeColor forState:UIControlStateNormal];
    
    
    skip=[[UIButton alloc]initWithFrame: CGRectMake(220, 410, 100, 40)];
    [skip setTitle:@"SKIP" forState:UIControlStateNormal];
    [skip addTarget:self action:@selector(parseJson:) forControlEvents:UIControlEventTouchUpInside];
    
    
    skip.layer.borderColor = self.makeColor.CGColor;
    skip.layer.borderWidth=1;
    [skip setTitleColor: self.makeColor forState:UIControlStateNormal];

    
    showAnswers = [[UIButton alloc]initWithFrame:CGRectMake(25, self.view.bounds.size.height-80, 100, 40)];
    [showAnswers setTitle:@"ANSWERS" forState:UIControlStateNormal];
    showAnswers.layer.borderWidth=1;
    showPosters= [[UIButton alloc]initWithFrame:CGRectMake(155, self.view.bounds.size.height-80,100, 40)];
    [showPosters setTitle:@"POSTERS" forState:UIControlStateNormal];
    showPosters.layer.borderWidth=1;
    submitQuestion= [[UIButton alloc]initWithFrame:CGRectMake(285, self.view.bounds.size.height-80,100, 40)];
    [submitQuestion setTitle:@"SUBMIT QUESTION" forState:UIControlStateNormal];
    submitQuestion.layer.borderWidth=1;
    showAnswers.layer.borderColor = self.makeColor.CGColor;
    [showAnswers setTitleColor:self.makeColor forState:UIControlStateNormal];
    showPosters.layer.borderColor = self.makeColor.CGColor;
    [showPosters setTitleColor:self.makeColor forState:UIControlStateNormal];
    submitQuestion.layer.borderColor = self.makeColor.CGColor;
    [submitQuestion setTitleColor:self.makeColor forState:UIControlStateNormal];
    
                  
    [showAnswers addTarget:self action:@selector(showAnswers:) forControlEvents:UIControlEventTouchUpInside];
    [showPosters addTarget:self action:@selector(showPosters:) forControlEvents:UIControlEventTouchUpInside];
    [submitQuestion addTarget:self action:@selector(submitQuestion:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:fixLabel];
    [self.view addSubview:questionLabel];
    [self.view addSubview:answer];
    [self.view addSubview:submit];
    [self.view addSubview:skip];
    [self.view addSubview:showAnswers];
    [self.view addSubview:showPosters];
    [self.view addSubview:submitQuestion];
      
}

-(IBAction)showAnswers:(UIButton *)sender
{
    NSArray *answers = [all objectForKey:@"answers"];
    popupView=[[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-200,self.view.bounds.size.width, 200)];
    popupView.backgroundColor = [self colorWithHexString:all[@"bgcolor"]];
    popupView.layer.borderWidth=2;
    popupView.layer.borderColor=self.makeColor.CGColor;
    NSLog(@"Color of text  is %@",self.makeColor);
    
    UIButton *close;
    close= [[UIButton alloc]initWithFrame:CGRectMake(popupView.bounds.size.width-100,popupView.bounds.origin.y+10, 50, 30)];
    [close setTitle:@"Close" forState:UIControlStateNormal];
    close.layer.borderWidth=1;
    //close.layer.cornerRadius=10;
    [close addTarget:self action:@selector(closePopup:) forControlEvents:UIControlEventTouchUpInside];
    close.layer.borderColor = self.makeColor.CGColor;
    [close setTitleColor:self.makeColor forState:UIControlStateNormal];
    [popupView addSubview:close];
    CGRect frame = CGRectMake(0, popupView.bounds.origin.y+50,self.view.bounds.size.width , 150);
    scrollView = [[ScrollingFeature alloc]initWithFrame:frame];
    [scrollView setPagingEnabled:YES];
    [scrollView setAlwaysBounceVertical:NO];
    [scrollView setTextColor:self.makeColor];
    [scrollView setConstraintsForText:answers];
    
    
    [popupView addSubview:close];
    [popupView addSubview:scrollView];
    [self.view addSubview:popupView];
    //scrollTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:scrollView selector:@selector(timerFired) userInfo:nil repeats:YES];

}

-(IBAction)closePopup:(UIButton *)sender
{
    [popupView removeFromSuperview];
}
-(IBAction)showPosters:(id)sender
{
    
    NSArray *posters = [all objectForKey:@"posters"];
    //NSArray *posters = [NSArray arrayWithObjects: @"img1.jpg",@"img2.jpg",nil];
    popupView=[[UIView alloc] initWithFrame:CGRectMake(0, 100 ,self.view.bounds.size.width, self.view.bounds.size.height-100)];
    popupView.backgroundColor = [self colorWithHexString:all[@"bgcolor"]];
    popupView.layer.borderWidth=2;
    popupView.layer.borderColor=self.makeColor.CGColor;
    UIButton *close;
    close= [[UIButton alloc]initWithFrame:CGRectMake(popupView.bounds.size.width-100,popupView.bounds.origin.y+10, 50, 30)];
    [close setTitle:@"Close" forState:UIControlStateNormal];
    close.layer.borderWidth=1;
    //close.layer.cornerRadius=10;
    [close addTarget:self action:@selector(closePopup:) forControlEvents:UIControlEventTouchUpInside];
    close.layer.borderColor = self.makeColor.CGColor;
    [close setTitleColor:self.makeColor forState:UIControlStateNormal];
    
    CGRect frame = CGRectMake(0, popupView.bounds.origin.y,self.view.bounds.size.width , self.view.bounds.size.height-100);
    scrollView = [[ScrollingFeature alloc]initWithFrame:frame];
    [scrollView setPagingEnabled:YES];
    [scrollView setAlwaysBounceVertical:NO];
    [scrollView setTextColor:self.makeColor];
    [scrollView setConstraints :posters NumberOfItemsPerPage:1];
    
    
    [scrollView addSubview:close];
    [popupView addSubview:scrollView];
    [self.view addSubview:popupView];
    //scrollTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:scrollView selector:@selector(timerFired) userInfo:nil repeats:YES];

}
-(IBAction)submitQuestion:(id)sender
{
    popupView=[[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-200,self.view.bounds.size.width, 200)];
    popupView.backgroundColor = [self colorWithHexString:all[@"bgcolor"]];
    popupView.layer.borderWidth=2;
    popupView.layer.borderColor=self.makeColor.CGColor;
    UIButton *close;
    close= [[UIButton alloc]initWithFrame:CGRectMake(popupView.bounds.size.width-100,popupView.bounds.origin.y+10, 50, 30)];
    [close setTitle:@"Close" forState:UIControlStateNormal];
    close.layer.borderWidth=1;
    //close.layer.cornerRadius=10;
    [close addTarget:self action:@selector(closePopup:) forControlEvents:UIControlEventTouchUpInside];
    close.layer.borderColor = self.makeColor.CGColor;
    [close setTitleColor:self.makeColor forState:UIControlStateNormal];
   
    questionTest=[[UITextField alloc]initWithFrame:CGRectMake(40, popupView.bounds.origin.y+50 ,self.view.bounds.size.width-2*40 , 40)];
    questionTest.layer.borderWidth=1;
    questionTest.layer.borderColor = self.makeColor.CGColor;
    questionTest.textColor= self.makeColor;
    questionTest.placeholder= @"Enter Your Question Here...";
    questionTest.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Your Question Here..." attributes:@{NSForegroundColorAttributeName: self.makeColor}];
    submitQuestionToApi=[[UIButton alloc]initWithFrame: CGRectMake(135, popupView.bounds.origin.y+120 , self.view.bounds.size.width-2*135, 40)];
    [submitQuestionToApi setTitle:@"SUBMIT" forState:UIControlStateNormal];
    [submitQuestionToApi addTarget:self action:@selector(submitQuestionApi:) forControlEvents:UIControlEventTouchUpInside];
    submitQuestionToApi.layer.borderColor = self.makeColor.CGColor;
    submitQuestionToApi.layer.borderWidth=1;
    [submitQuestionToApi setTitleColor: self.makeColor forState:UIControlStateNormal];
    
    
    
    
    [popupView addSubview:close];
    [popupView addSubview:questionTest];
    [popupView addSubview:submitQuestionToApi];
    
    [self.view addSubview:popupView];
}


-(IBAction)submitQuestionApi:(id)sender
{
    NSString *urlString = [NSString stringWithFormat:@"http://api.whatsyourexcuse.co/wye/questions/"];
    NSLog(@"URl is %@",urlString);
    
    // Create the request.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    // Specify that it will be a POST request
    request.HTTPMethod = @"POST";
    
    
    NSDictionary *postData = [[NSDictionary alloc] initWithObjectsAndKeys:
                              questionTest.text, @"question",nil];
    
    NSError *postError;
    
    NSData *postdataJson = [NSJSONSerialization dataWithJSONObject:postData options:0  error:&postError];
    [request setHTTPBody:postdataJson];
    
    // This is how we set header fields
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    
    
    // Create url connection and fire request
    //NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    NSURLResponse *postResponse;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&postResponse
                                                     error:&postError];
    NSLog(@"Response is %@",postResponse);
    if(data != nil)
        NSLog(@"Succesfully done");
    
    //        all = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves | NSJSONReadingMutableLeaves error:&postError];
    //
    NSLog(@"Count for post is %lu",(unsigned long)all.count);
    questionTest.text=@"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
