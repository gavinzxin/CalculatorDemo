//
//  OperateFactory.m
//  CalculatorDemo
//
//  Created by 张鑫 on 16/3/22.
//  Copyright © 2016年 张鑫. All rights reserved.
//

#import "OperateFactory.h"

@implementation OperateFactory

+(id)createOperation:(char)operation{
    Operate *oper;
//根据参数的不同创建对象，这里的参数是输入的运算符
    switch (operation) {
        case '+':
            oper = [[OperateSum alloc]init];
            break;
        case '-':
            oper = [[OperateSub alloc]init];
            break;
        case '*':
            oper = [[OperateMub alloc]init];
            break;
        case '/':
            oper = [[OperateDiv alloc]init];
            break;
        default:
            break;
    }
    return oper;
}

@end
