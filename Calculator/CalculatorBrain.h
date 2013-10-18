//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Serena Simkus on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;
- (double)clearMemory:(NSString *)clear;

@end
