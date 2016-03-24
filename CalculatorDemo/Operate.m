//
//  Operate.m
//  CalculatorDemo
//
//  Created by 张鑫 on 16/3/22.
//  Copyright © 2016年 张鑫. All rights reserved.
//

#import "Operate.h"

@implementation Operate

//初始化两个数
-(id)initwithNum1:(double)num1 Num2:(double)num2
{
    if([super init]){
        self.number1 = num1;
        self.number2 = num2;
    }
    return self;
}

//父类的运算方法，并返回结果
-(NSString *)getResult{
    double result=0;
    NSString *str=[NSString stringWithFormat:@"%lf",result];
    return str;
}
@end

/************************************
 重写父类的运算方法
 ************************************/
@implementation OperateSum

-(NSString *)getResult{
    double result=0;
    result = self.number1 + self.number2;
    NSString *str=[NSString stringWithFormat:@"%lf",result];
    return str;
}
@end

@implementation OperateSub

-(NSString *)getResult{
    double result=0;
    result = self.number1 - self.number2;
    NSString *str=[NSString stringWithFormat:@"%lf",result];
    return str;
}
@end

@implementation OperateMub
-(NSString *)getResult{
    double result=0;
    result = self.number1 * self.number2;
    NSString *str=[NSString stringWithFormat:@"%lf",result];
    return str;
}
@end

@implementation OperateDiv
-(NSString *)getResult{
    double result=0;
    NSString *str;
    if (self.number2 == 0){
        str=[NSString stringWithFormat:@"错误"];
    }
    else{
    result = self.number1 / self.number2;
        str=[NSString stringWithFormat:@"%lf",result];
    }
    return str;
}
@end
