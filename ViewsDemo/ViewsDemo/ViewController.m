//
//  ViewController.m
//  ViewsDemo
//
//  Created by Vaibhav Jain on 15/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "ViewController.h"
 

@interface ViewController ()

{
    UITextField *textField;
    UISlider *slider;
    UIStepper *stepper;
    UISwitch *switch1;
    UISegmentedControl *segmentedControl;
    UIPickerView *picker;
    UIActionSheet *actionSheet;
    UIPickerView *pickerView;
    NSMutableArray *dataArray;
    
}
@end

@implementation ViewController



//- (void)tapAndSlide:(UILongPressGestureRecognizer*)gesture
//{
//    CGPoint pt = [gesture locationInView: self];
//    CGFloat thumbWidth = [self thumbRect].size.width;
//    CGFloat value;
//
//    if(pt.x <= [self thumbRect].size.width/2.0)
//        value = self.minimumValue;
//    else if(pt.x >= self.bounds.size.width - thumbWidth/2.0)
//        value = self.maximumValue;
//    else {
//        CGFloat percentage = (pt.x - thumbWidth/2.0)/(self.bounds.size.width - thumbWidth);
//        CGFloat delta = percentage * (self.maximumValue - self.minimumValue);
//        value = self.minimumValue + delta;
//    }
//
//    if(gesture.state == UIGestureRecognizerStateBegan){
//        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            [self setValue:value animated:YES];
//            [super sendActionsForControlEvents:UIControlEventValueChanged];
//        } completion:nil];
//    }
//    else [self setValue:value];
//
//    if(gesture.state == UIGestureRecognizerStateChanged)
//        [super sendActionsForControlEvents:UIControlEventValueChanged];
//}

- (IBAction)sliderAction:(id)sender
{
    UISlider *MYslider = (UISlider *)sender;
    float SliderValue = (MYslider.value);
    [textField setText: [NSString stringWithFormat:@"%f",SliderValue]];
    
    
}


-(IBAction)stepperAction:(id)sender
{
    UIStepper *MYstepper = (UIStepper *)sender;
    double StepperValue = (MYstepper.value);
    [textField setText: [NSString stringWithFormat:@"%g",StepperValue]];
}


-(IBAction)switchAction:(UISwitch*)sender
{
    NSLog(@"value is %d",sender.isOn);
    textField.text = [NSString stringWithFormat:@"%d",sender.isOn];
    
}

-(IBAction)MySegmentControlAction:(UISegmentedControl *)sender
{
    if(sender.selectedSegmentIndex == 0)
    {
        textField.text=[NSString stringWithFormat:@"%d",(int)sender.selectedSegmentIndex];
//        PickerViewController *picker = [[PickerViewController alloc]init];
//        [self.navigationController pushViewController:picker animated:YES];
        
    }
    else if(sender.selectedSegmentIndex == 1)
    {
        textField.text=[NSString stringWithFormat:@"%d",(int)sender.selectedSegmentIndex];
        
    }
    else if(sender.selectedSegmentIndex == 2)
    {
        textField.text=[NSString stringWithFormat:@"%d",(int)sender.selectedSegmentIndex];
        
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    switch (actionSheet.tag)
    {
        case 1:
        {
            switch (buttonIndex)                //way of implementing/handling multiple action sheets
            {
                case 0:
                    NSLog(@"%@",buttonTitle);
                    break;
                case 1:
                    NSLog(@"Twiter");
                    
                    break;
                case 2:
                    NSLog(@"Email");
                    
                    break;
                case 3:
                    NSLog(@"Camera Roll");
                    
                    break;
                case 4:
                    NSLog(@"Rate This App");
                    
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}


// Number of components.
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [dataArray count];
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [dataArray objectAtIndex: row];
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"You selected this: %@", [dataArray objectAtIndex: row]);
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    dataArray = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [dataArray addObject:@"One"];
    [dataArray addObject:@"Two"];
    [dataArray addObject:@"Three"];
    [dataArray addObject:@"Four"];
    [dataArray addObject:@"Five"];
    
    
    pickerView = [[UIPickerView alloc] init];
    
    // Set the delegate and datasource. Don't expect picker view to work
    // correctly if you don't set it.
    [pickerView setDataSource: self];
    [pickerView setDelegate: self];
    pickerView.tintColor= [UIColor greenColor];
    pickerView.backgroundColor=[UIColor greenColor];
    
    
    // Set the picker's frame. We set the y coordinate to 50px.
    [pickerView setFrame: CGRectMake(100, 320, 250, 200.0f)];
    
    // Before we add the picker view to our view, let's do a couple more
    // things. First, let the selection indicator (that line inside the
    // picker view that highlights your selection) to be shown.
    pickerView.showsSelectionIndicator = YES;
    
    [pickerView selectRow:2 inComponent:0 animated:YES];
    
    // OK, we are ready. Add the picker in our view.
    [self.view addSubview: pickerView];
  
    
    
    CGRect textFieldFrame = CGRectMake(100, 30, 200, 40);
    CGRect sliderFrame = CGRectMake(100, 120, 200, 10.0);
    CGRect stepperFrame = CGRectMake(100, 150, 200, 40);
    CGRect switchFrame = CGRectMake(150, 210, 50, 30);
    CGRect segmentedFrame = CGRectMake(100, 260, 200, 40);
    
    
    
    
    
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Sharing option:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                   @"Share on Facebook",
                   @"Share on Twitter",
                   @"Share via E-mail",
                   @"Save to Camera Roll",
                   @"Rate this App",
                   nil];
    
//    actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];

    actionSheet.tintColor=[UIColor greenColor];
    actionSheet.tag =1; // by default value is 0
    
//    [pickerView setBounds:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width)];
//    [actionSheet addSubview:pickerView];
    
    [actionSheet showInView:self.view];
    
    
    
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"One", @"Two", @"Three", nil];
    segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray ];
    segmentedControl.frame = segmentedFrame;
    //segmentedControl.segmentedControlStyle = UISegmentedControlStyleBordered;
    [segmentedControl addTarget:self action:@selector(MySegmentControlAction:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 1;
    segmentedControl.tintColor= [UIColor greenColor];
    
    [self.view addSubview:segmentedControl];
    
    switch1 = [[UISwitch alloc]initWithFrame:switchFrame];
    switch1.tintColor=[UIColor orangeColor];
    switch1.onTintColor=[UIColor greenColor];
    switch1.thumbTintColor=[UIColor redColor];
    [switch1 setOn:YES];
    
    [switch1 addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:switch1];
    
    
    
    stepper = [[UIStepper alloc]initWithFrame:stepperFrame];
    stepper.minimumValue=11;
    stepper.maximumValue=25;
    stepper.stepValue =2;
    stepper.value=13;
    stepper.tintColor=[UIColor greenColor];
    [stepper addTarget:self action:@selector(stepperAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper];
    
    textField =[[UITextField alloc]initWithFrame:textFieldFrame];
    textField.backgroundColor=[UIColor brownColor];
    
    
    
    // sliderAction will respond to the updated slider value
    slider = [[UISlider alloc] initWithFrame:sliderFrame];
    slider.minimumValue = 0.0;
    slider.maximumValue = 10.0;
    slider.continuous = YES;
    
    // Initial value
    slider.value = 7;
    // slider.backgroundColor = [UIColor lightGrayColor];
    //slider.minimumValueImage= [UIImage imageNamed:@"min.jpg"] ;
    //slider.maximumValueImage = [UIImage imageNamed:@"max.jpg"];
    
    slider.minimumTrackTintColor=[UIColor redColor];
    slider.maximumTrackTintColor=[UIColor greenColor];
    slider.thumbTintColor=[UIColor yellowColor];
    //    slider.currentMinimumTrackImage=[]
    //    slider.currentMaximumTrackImage=
    //    slider.currentThumbImage
    
    [slider addGestureRecognizer:[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(tapAndSlide:)]];
    
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:textField];
    [self.view addSubview:slider];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
