//
//  Operate.h
//  CalculatorDemo
//
//  Created by 张鑫 on 16/3/22.
//  Copyright © 2016年 张鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

/************************************
 多态：
 有一个计算类是父类，子类有加减乘除，创建的时候是父类对象，
 具体的操作用子类创建，创建的时候用工厂。
 ************************************/

@interface Operate : NSObject

@property(nonatomic,assign) double number1;
@property(nonatomic,assign) double number2;

-(id)initwithNum1:(double)num1 Num2:(double)num2;
-(NSString *)getResult;

@end

/************************************
 子类
 ************************************/
@interface OperateSum : Operate
@end

@interface OperateSub : Operate
@end

@interface OperateMub : Operate
@end

@interface OperateDiv : Operate
@end
