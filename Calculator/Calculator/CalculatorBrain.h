//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Vaibhav Jain on 01/09/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject


-(void)pushOperand:(double) operand ;
-(double) performOperation:(NSString *)operation;

@property(readonly) id program;

+(double) runProgram:(id)program;
+(NSString *)descriptionOfProgram:(id)program;

@end
