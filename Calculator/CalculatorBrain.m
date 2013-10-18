//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Serena Simkus on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack
{
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (void)pushOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

- (double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

- (double)clearMemory:(NSString *)clear
{
    if ([clear isEqualToString:@"C"]) {
        if (_operandStack) [self.operandStack removeAllObjects];
    }
    return 0;
}    

- (double)performOperation:(NSString *)operation
{
    double result = 0;
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if ([@"*" isEqualToString:operation]) {
        result = [self popOperand] * [self popOperand];
    } else if ([operation isEqualToString:@"-"]) {
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    } else if ([operation isEqualToString:@"/"]) {
        double divisor = [self popOperand];
        if (divisor) result = [self popOperand] / divisor;
    } else if ([operation isEqualToString:@"sin"]) {
        result = sin([self popOperand]);
    } else if ([operation isEqualToString:@"cos"]) {
        result = cos([self popOperand]);
    } else if ([operation isEqualToString:@"sqrt"]) {
        result = pow([self popOperand], .5);
    } else if ([operation isEqualToString:@"π"]) {
        result = M_PI;
    } else if ([operation isEqualToString:@"log"]) {
        result = log10([self popOperand]);
    } else if ([operation isEqualToString:@"ln"]) {
        result = log([self popOperand]);
    } else if ([operation isEqualToString:@"e"]) {
        result = M_E;
    } else if ([operation isEqualToString:@"tan"]) {
        result = tan([self popOperand]);
    } else if ([operation isEqualToString:@"x^2"]) {
        result = pow([self popOperand], 2);
    } else if ([operation isEqualToString:@"e^x"]) {
        result = pow(M_E, [self popOperand]);
    } else if ([operation isEqualToString:@"^"]) {
        double exp = [self popOperand];
        result = pow([self popOperand], exp);
    } else if ([operation isEqualToString:@"csc"]) {
        result = 1 / sin([self popOperand]);
    } else if ([operation isEqualToString:@"sec"]) {
        result = 1 / cos([self popOperand]);
    } else if ([operation isEqualToString:@"cot"]) {
        result = 1 / tan([self popOperand]);
    } else if ([operation isEqualToString:@"%"]) {
        result = [self popOperand] / 100.0;
    }
    [self pushOperand:result];
    return result;
}

@end
