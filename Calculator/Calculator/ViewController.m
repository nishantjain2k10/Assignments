//
//  ViewController.m
//  Calculator
//
//  Created by Vaibhav Jain on 01/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()


@property(nonatomic ,assign) BOOL userIsInTheMiddleOfEnteringANumber;
@property(nonatomic , strong) CalculatorBrain * brain;
@property (weak, nonatomic) IBOutlet UIButton *digit8;

@end

@implementation ViewController

//@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;



//-(BOOL) userIsInTheMiddleOfEnteringANumber
//{
//    _userIsInTheMiddleOfEnteringANumber = NO;
//    return  _userIsInTheMiddleOfEnteringANumber;
//}

-(CalculatorBrain *) brain
{
    if(!_brain)
    {
        _brain = [[CalculatorBrain alloc]init];
    }
    return _brain;
}

- (IBAction)Enter
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber= NO;
}

- (IBAction)operationPerform:(UIButton *)sender
{
    if(self.userIsInTheMiddleOfEnteringANumber)
    {
        [self Enter];
    }
    NSLog(@"operation is %@",sender.currentTitle);
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g" , result];
    self.display.text=resultString;
    
}
- (IBAction)clearDisplay
{

    self.display.text = @"0";
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)digitPressed:(id)sender
{

    NSString *digit = [sender currentTitle];
    //NSLog(@" digit pressed is : %@" , digit);
    
//    NSLog(@"value is :- %@" ,self.userIsInTheMiddleOfEnteringANumber);
    if(self.userIsInTheMiddleOfEnteringANumber == YES)
    {
        self.display.text = [self.display.text stringByAppendingString:digit];
    }
    
    
    //self.display.text = [self.display.text stringByAppendingString:digit];
    
    else
    {
        self.display.text=digit;
        self.userIsInTheMiddleOfEnteringANumber=YES;
    }
    //NSLog(@"display is : %@" ,self.display.text);

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    CALayer *btnLayer = [roundedButton layer];
//    [btnLayer setMasksToBounds:YES];
//    [btnLayer setCornerRadius:5.0f];
    
//    self.digit8.layer.cornerRadius = 5;
//   // self.digit8.layer.masksToBounds=YES;
//    self.digit8.clipsToBounds=YES;
    
    
    
    //self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
