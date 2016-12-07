//
//  CalculationViewController.m
//  AppDelegateMethodsCheck
//
//  Created by Vaibhav Jain on 27/08/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "CalculationViewController.h"
#import "Test2ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"

@interface CalculationViewController ()




//@property(nonatomic , weak) UITextField *first;
//@property(nonatomic,weak) UITextField *second;
//@property(nonatomic,weak) UITextField *result;
//

@end

@implementation CalculationViewController






UILabel *firstNumber;
UILabel *secondNumber;
UITextField *first;
UITextField *second;
UITextField *result;
UIButton *plus;
UIButton *minus;
UIButton *multiply;
UIButton *divide;
UIImageView *backgroundImage;
UIButton *new;


-(id) init
{
    self = [super init];
    if(self)
    {
        
       // [plus addTarget: self action:@selector(Add) forControlEvents:<#(UIControlEvents)#>];

        
        
        
        
        
        
        
    }
    return self;
}



-(IBAction)next
{
    
    
    UIViewController *viewController = [Test2ViewController alloc];
    
    [self.navigationController pushViewController: viewController animated:YES];

}


-(IBAction) Add
{
    
    int sum = [first.text intValue] + [second.text intValue];
    result.text = [NSString stringWithFormat:@ "%d" , sum];
    
    

    
    
}
-(IBAction) Subtract
{
  
    int sub= [first.text intValue] - [second.text  intValue];
    result.text = [NSString stringWithFormat: @"%d" , sub];
    
}
-(IBAction)  Multiply
{
    
    int mul = [first.text intValue] * [second.text intValue];
    result.text = [NSString  stringWithFormat: @"%d" , mul];
    
    
}

-(IBAction) Divide
{
    double  div  = [first.text doubleValue] / [second.text doubleValue];
    result.text = [NSString stringWithFormat:@"%f", div];
    
}

 



- (void)viewDidLoad {
    [super viewDidLoad];
    
    ViewController *view;
    view = [ViewController alloc];
    [view addNavigationBarButton];
    
    
    //self.view.backgroundColor = [UIColor brownColor];
    
    //self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background"]];
    
    
    
    
    
    backgroundImage= [[UIImageView alloc] initWithFrame: CGRectMake( 0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //backgroundImage.frame= CGRectMake( 0,0, self.view.frame.size.width,  self.view.frame.size.height);
    [backgroundImage  setImage: [UIImage imageNamed: @"background1"]];
    //[backgroundImage  setImage: [UIImage imageNamed: @"background.jpg"]];
    
    
    
    firstNumber =[[UILabel alloc] initWithFrame:CGRectMake( 75, 125, 120, 25)];
    firstNumber.textColor = [UIColor blueColor];
    
    first = [ [UITextField alloc] initWithFrame: CGRectMake( 250, 125,100 ,25)];
    first.borderStyle= UITextBorderStyleLine;
    //first.backgroundColor = [UIColor blueColor];
     first.layer.borderColor = [[UIColor blueColor] CGColor];
   
    
    
    
    secondNumber = [[UILabel alloc] initWithFrame: CGRectMake(75,200,120,25)];
    secondNumber.textColor = [UIColor blueColor];
    
    second = [ [UITextField alloc] initWithFrame: CGRectMake( 250, 200,100 ,25)];
    //second.backgroundColor = [UIColor blueColor];
    second.borderStyle=UITextBorderStyleLine;
    second.layer.borderColor = [[UIColor blueColor] CGColor];

    
    result = [ [ UITextField alloc] initWithFrame: CGRectMake( 150,  275,  100, 25)];
    //result.borderStyle=UITextBorderStyleRoundedRect;
    
    
    result.borderStyle = UITextBorderStyleLine;
    //result.backgroundColor = [ UIColor  blueColor];
    result.layer.borderColor = [[UIColor blueColor] CGColor];
    

    plus = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [plus setFrame: CGRectMake( 75,350  ,50  ,20 )];
    //plus.frame= CGRectMake(125, 350, 50, 20);
    [plus setTitle: @"Plus" forState: UIControlStateNormal];
    [plus addTarget: self action: @selector(Add) forControlEvents:UIControlEventTouchUpInside];
    [plus setBackgroundColor: [UIColor lightGrayColor]];
    
    plus.layer.cornerRadius = 10;
    plus.clipsToBounds = YES;
    
    
    
    
    minus = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    minus.frame= CGRectMake(145,350 , 50, 20);
    [minus setTitle: @"Minus" forState: UIControlStateNormal];
    [minus addTarget: self action: @selector(Subtract) forControlEvents:UIControlEventTouchUpInside];
    [minus setBackgroundColor: [UIColor lightGrayColor]];
    
    minus.layer.cornerRadius = 10;
    minus.clipsToBounds = YES;
    
    multiply = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    multiply.frame= CGRectMake(220,350,50,20);
    [multiply setTitle: @"Mul" forState: UIControlStateNormal];
    [multiply addTarget: self action: @selector(Multiply) forControlEvents:UIControlEventTouchUpInside];
     [multiply setBackgroundColor: [UIColor lightGrayColor]];
    multiply.layer.cornerRadius = 10;
    multiply.clipsToBounds = YES;
    
    divide = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    divide.frame= CGRectMake(295,350,50,20);
    [divide setTitle: @"Divide" forState: UIControlStateNormal];
    [divide addTarget: self action: @selector(Divide) forControlEvents:UIControlEventTouchUpInside];
     [divide setBackgroundColor: [UIColor lightGrayColor]];
    divide.layer.cornerRadius = 10;
    divide.clipsToBounds = YES;
    
    
    
    new = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    new.frame = CGRectMake(150, 450 , 60, 40);
    [new setTitle: @"Go Next" forState: UIControlStateNormal];
    [new addTarget: self action: @selector(next) forControlEvents:UIControlEventTouchUpInside];
    [new setBackgroundColor: [UIColor lightGrayColor]];
    new.layer.cornerRadius = 10;
    new.clipsToBounds = YES;
    
    
    
    first.placeholder = @"Enter";
    second.placeholder = @"Enter";
    result.placeholder = @"result";
    firstNumber.text= @"FirstNumber";
    secondNumber.text= @"SecondNumber";
    plus.titleLabel.text = @"Plus";
    minus.titleLabel.text=@"Minus";
    multiply.titleLabel.text=@"Mul";
    divide.titleLabel.text=@"Div";
    
    
     [self.view addSubview: backgroundImage];
    [self.view addSubview:firstNumber];
    [self.view addSubview: first];
    [self.view addSubview: secondNumber];
    [self.view addSubview: second];
    [self.view addSubview: result];
    [self.view addSubview: plus];
    [self.view addSubview: minus];
    [self.view addSubview: multiply];
    [self.view addSubview: divide];
    [ self.view addSubview:new];

    
  
    
    
    
    //  [plus addTarget: self action:@selector(Add) forControlEvents:(UIControlEvents)];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
