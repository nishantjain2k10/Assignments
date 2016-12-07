//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Vaibhav Jain on 01/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "CalculatorBrain.h"


@interface CalculatorBrain()

//@property(nonatomic,strong) NSMutableArray *operandStack;
@property(nonatomic,strong) NSMutableArray *programStack;


@end


@implementation CalculatorBrain


-(NSMutableArray *)programStack
{
    if(_programStack == nil)
    {
        _programStack=[[NSMutableArray alloc]init];
    }
    return _programStack;
}


//-(double) popOperand
//{
//    NSNumber *operandObject = [self.operandStack lastObject];
//    if(operandObject != nil)
//    {
//        [self.operandStack removeLastObject];
//    }
//    NSLog(@"popped item is :- %g",[operandObject doubleValue]);
//    return [operandObject doubleValue];
//}


//push method would remain same for programmable calculator
-(void) pushOperand:(double)operand
{
    NSLog(@"pushed  item is :- %g",operand);
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.programStack addObject: operandObject];
}

-(double)performOperation:(NSString *)operation
{
    
    [self.programStack addObject:operation];
   return  [CalculatorBrain runProgram: self.program];
    
}


-(id) program
{
    return [self.programStack copy];
}

+ (NSString *) descriptionOfProgram:(id)program
{
    return(@"implment this in assignment 2");
}


+(double)popOperandOffStack:(NSMutableArray *)stack
{
    double result =0;
    id topOfStack = [stack lastObject];
    if(topOfStack)
    {
        [stack removeLastObject];
    }
    if([topOfStack isKindOfClass: [ NSNumber class]])
    {
        result = [topOfStack doubleValue];
    }
    else if([topOfStack isKindOfClass:[ NSString class]])

    {
        NSString *operation = topOfStack;
        if([operation isEqualToString: @"+"])
        {
            result= [self popOperandOffStack:stack]+[self popOperandOffStack: stack];
            
        }
        else if([operation isEqualToString:@"-"])
        {
            result= -([self popOperandOffStack: stack]-[self popOperandOffStack: stack]);
        }
        else if([operation isEqualToString:@"*"])
        {
            result= [self popOperandOffStack: stack]*[self popOperandOffStack: stack];
        }
        else if([operation isEqualToString:@"/"])
        {
            result= (1/([self popOperandOffStack: stack]/[self popOperandOffStack: stack]));
        }
    
    }
    
    return result;
}

+(double) runProgram:(id)program
{
    NSMutableArray *stack;
    if([program isKindOfClass: [NSArray class]])
    {
        stack = [program mutableCopy];
    }
    return [self popOperandOffStack:stack];
}

//double result = 0;
//    
//    if([operation isEqualToString: @"+"])
//    {
//        result= [self popOperand]+[self popOperand];
//        
//    }
//    else if([operation isEqualToString:@"-"])
//    {
//        result= -([self popOperand]-[self popOperand]);
//    }
//    else if([operation isEqualToString:@"*"])
//    {
//        result= [self popOperand]*[self popOperand];
//    }
//    else if([operation isEqualToString:@"/"])
//    {
//        result= (1/([self popOperand]/[self popOperand]));
//    }
//    NSLog(@"Result is %g",result);
//
//    return result;
//}


@end
