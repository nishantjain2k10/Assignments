//
//  ViewController.m
//  Happiness
//
//  Created by Vaibhav Jain on 06/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "HappinessViewController.h"
#import "FaceView.h"

@interface HappinessViewController () <FaceViewDataSource>

 
@property (weak, nonatomic) IBOutlet FaceView *faceView;

@end

@implementation HappinessViewController

//@synthesize happiness = _happiness;

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}



-(float)smileForFaceView:(FaceView *)sender
{
    return (self.happiness-50)/50.0;
}

-(void)setFaceView:(FaceView *)faceView
{
    _faceView=faceView;
    [self.faceView addGestureRecognizer: [[UIPinchGestureRecognizer alloc]initWithTarget: self.faceView action:@selector(pinch:)]];
    [self.faceView addGestureRecognizer: [[UIPanGestureRecognizer alloc]initWithTarget: self action:@selector(handleHappinessGesture:)]];
    self.faceView.dataSource=self;
}

-(void)handleHappinessGesture:(UIPanGestureRecognizer *)gesture
{
    if((gesture.state == UIGestureRecognizerStateEnded) || (gesture.state == UIGestureRecognizerStateChanged))
    {
        
        CGPoint translation = [gesture translationInView:self.faceView ];
        self.happiness-=translation.y/2;
        [gesture setTranslation: CGPointZero inView:self.faceView];
    }
}

-(void) setHappiness:(int)happiness
{
    NSLog(@"method called");
    _happiness = happiness;
    [self.faceView setNeedsDisplay]; // dont need to call drawRect again and again
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
