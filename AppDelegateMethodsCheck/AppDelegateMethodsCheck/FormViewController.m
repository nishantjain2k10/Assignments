//
//  FormViewController.m
//  AppDelegateMethodsCheck
//
//  Created by Vaibhav Jain on 29/08/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "FormViewController.h"
#import "DBManager.h"
#import "CalculationViewController.h";
#import "Test2ViewController.h"
#import "ViewController.h";\

@implementation FormViewController

UILabel *label;

UILabel *regNo;
UILabel *name;
UILabel *year;
UILabel *department;


UITextField *regNoTextField;
UITextField *nameTextField;
UITextField *departmentTextField;
UITextField *yearTextField;
UITextField *findByRegisterNumberTextField;
UIScrollView *myScrollView;
UIButton *find;
UIButton *save;
UIImageView *backgroundImage1;
UITextField *countField;
UIButton *countButton;

//UIAlertController *alertController;


UIAlertView *alert;


- (void)viewDidLoad
{
     [super viewDidLoad];
    
    ViewController *view;
    view = [ViewController alloc];
    [view addNavigationBarButton];
    
    
    //alertController = [UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    
    
    //[self presentViewController:alertController animated:YES completion:nil];
    
    
    
    backgroundImage1= [[UIImageView alloc] initWithFrame: CGRectMake( 0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [backgroundImage1  setImage: [UIImage imageNamed: @"background.jpg"]];
    [self.view addSubview: backgroundImage1];
    
    
    label =[[UILabel alloc] initWithFrame:CGRectMake( 100, 25, self.view.bounds.size.width-2*100, 25)];
    label.textColor = [UIColor blueColor];
    label.text=@"Students Details";
    [self.view addSubview: label];
    
    myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(25, 75, self.view.bounds.size.width-2*25,self.view.bounds.size.height-100-2*75)];
    myScrollView.backgroundColor = [UIColor cyanColor];
    myScrollView.scrollEnabled = YES;
    myScrollView.pagingEnabled = YES;
    myScrollView.showsVerticalScrollIndicator = YES;
    myScrollView.showsHorizontalScrollIndicator = YES;
    myScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 2, self.view.bounds.size.height);
    [self.view addSubview:myScrollView];

    
    
    
    findByRegisterNumberTextField = [ [UITextField alloc] initWithFrame: CGRectMake( 10, 15,200 ,25)];
    findByRegisterNumberTextField.borderStyle= UITextBorderStyleRoundedRect;
    //first.backgroundColor = [UIColor blueColor];
    findByRegisterNumberTextField.layer.borderColor = [[UIColor blueColor] CGColor];
    [myScrollView addSubview: findByRegisterNumberTextField];
    
    
    
    find = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [find setFrame: CGRectMake( 250,10  ,50  ,40 )];
    //plus.frame= CGRectMake(125, 350, 50, 20);
    [find setTitle: @"Find" forState: UIControlStateNormal];
    [find addTarget: self action: @selector(findData:) forControlEvents:UIControlEventTouchUpInside];
    [find setBackgroundColor: [UIColor lightGrayColor]];
    find.layer.cornerRadius = 10;
    find.clipsToBounds = YES;
    [myScrollView addSubview:find];

    
    
    
    regNo =[[UILabel alloc] initWithFrame:CGRectMake( 30, 80, 100, 30)];
    regNo.textColor = [UIColor blueColor];
    regNo.text=@"Reg No";
    [myScrollView addSubview: regNo];
    
    regNoTextField = [ [UITextField alloc] initWithFrame: CGRectMake( 180, 80,120 ,30)];
    regNoTextField.borderStyle= UITextBorderStyleLine;
    regNoTextField.layer.borderColor = [[UIColor blueColor] CGColor];
    [myScrollView addSubview: regNoTextField];
    
    
    name =[[UILabel alloc] initWithFrame:CGRectMake( 30, 135, 100, 30)];
    name.textColor = [UIColor blueColor];
    name.text=@"Name";
    [myScrollView addSubview: name];
    
    nameTextField = [ [UITextField alloc] initWithFrame: CGRectMake( 180, 135,120 ,30)];
    nameTextField.borderStyle= UITextBorderStyleLine;
    nameTextField.layer.borderColor = [[UIColor blueColor] CGColor];
    [myScrollView addSubview: nameTextField];
    
    
    department =[[UILabel alloc] initWithFrame:CGRectMake( 30, 190, 100, 30)];
    department.textColor = [UIColor blueColor];
    department.text=@"Department";
    [myScrollView addSubview: department];
    
    departmentTextField = [ [UITextField alloc] initWithFrame: CGRectMake( 180, 190,120 ,30)];
    departmentTextField.borderStyle= UITextBorderStyleLine;
    departmentTextField.layer.borderColor = [[UIColor blueColor] CGColor];
    [myScrollView addSubview: departmentTextField];
    
    year =[[UILabel alloc] initWithFrame:CGRectMake( 30, 245, 100, 30)];
    year.textColor = [UIColor blueColor];
    year.text=@"year";
    [myScrollView addSubview: year];
    
    
    
   

    yearTextField = [ [UITextField alloc] initWithFrame: CGRectMake( 180, 245,120 ,30)];
    yearTextField.borderStyle= UITextBorderStyleLine;
    yearTextField.layer.borderColor = [[UIColor blueColor] CGColor];
    [myScrollView addSubview: yearTextField];

    
    
    
    
    save = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [save setFrame: CGRectMake( 180,370  ,50  ,30 )];
    //plus.frame= CGRectMake(125, 350, 50, 20);
    [save setTitle: @"Save" forState: UIControlStateNormal];
    [save addTarget: self action: @selector(saveData:) forControlEvents:UIControlEventTouchUpInside];
    [save setBackgroundColor: [UIColor lightGrayColor]];
    save.layer.cornerRadius = 10;
    save.clipsToBounds = YES;
    [myScrollView addSubview: save];

    
    
    
    
    countField = [ [UITextField alloc] initWithFrame: CGRectMake( 30, 420,120 ,30)];
    countField.borderStyle= UITextBorderStyleLine;
    countField.layer.borderColor = [[UIColor blueColor] CGColor];
    [myScrollView addSubview: countField];

    
    
    countButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [countButton setFrame: CGRectMake( 180,420  ,50 ,30 )];
    //plus.frame= CGRectMake(125, 350, 50, 20);
    [countButton setTitle: @"Count" forState: UIControlStateNormal];
    [countButton addTarget: self action: @selector(countRows:) forControlEvents:UIControlEventTouchUpInside];
    [countButton setBackgroundColor: [UIColor lightGrayColor]];
    countButton.layer.cornerRadius = 10;
    countButton.clipsToBounds = YES;
    [myScrollView addSubview: countButton];
    

    
    
    
    
    //CalculationViewController *ca = [CalculationViewController alloc];
    Test2ViewController *test2 = [Test2ViewController alloc];
    
    NSArray *viewControllers = [[self navigationController] viewControllers];
    for (int i = 0; i < [viewControllers count]; i++){
        id obj = [viewControllers objectAtIndex:i];
        if ([obj isKindOfClass:[FormViewController class]]){
            [[self navigationController] popToViewController: test2 animated:YES];
            return;
        }
    }
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)saveData:(id)sender{
    BOOL success = NO;
    NSString *alertString = @"Data Insertion failed";
    if (regNoTextField.text.length>0 &&nameTextField.text.length>0 &&
        departmentTextField.text.length>0 &&yearTextField.text.length>0 )
    {
        success = [[DBManager getSharedInstance]saveData:
                   regNoTextField.text name:nameTextField.text department:
                   departmentTextField.text year:yearTextField.text];
    }
    else{
        alertString = @"Enter all fields";
    }
    if (success == NO) {
        alert = [[UIAlertView alloc]initWithTitle:alertString message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert  show];
        
       // UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        //[alertController addAction:ok];
        //[self presentViewController:alertController animated:YES completion:nil];
        
    }
}

-(IBAction)findData:(id)sender{
    NSArray *data = [[DBManager getSharedInstance]findByRegisterNumber:
                     findByRegisterNumberTextField.text];
    if (data == nil) {
        alert = [[UIAlertView alloc]initWithTitle:@"Data not found" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
//        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Data Not Found" style:UIAlertActionStyleDefault handler:nil];
//        [alertController addAction:ok];
//        [self presentViewController:alertController animated:YES completion:nil];
        regNoTextField.text = @"";
        nameTextField.text =@"";
        departmentTextField.text = @"";
        yearTextField.text =@"";
    }
    else{
        regNoTextField.text = findByRegisterNumberTextField.text;
        nameTextField.text =[data objectAtIndex:0];
        departmentTextField.text = [data objectAtIndex:1];
        yearTextField.text =[data objectAtIndex:2];
    }
}


-(IBAction)countRows:(id)sender
{
    int count  = [[DBManager getSharedInstance] countNumberOfRows];
    
    countField.text = [NSString  stringWithFormat: @"%d" , count];

}

@end
