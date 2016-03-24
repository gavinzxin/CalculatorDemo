//
//  Keyboard.m
//  CalculatorDemo
//
//  Created by 张鑫 on 16/3/23.
//  Copyright © 2016年 张鑫. All rights reserved.
//

/************************************
 做键盘界面和运算符并监听
 ************************************/

#import "Keyboard.h"
@interface Keyboard()
{
    Operate *oper;
    double a;
    BOOL flag;
}
@end

@implementation Keyboard

-(id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]){
        self.backgroundColor = [UIColor blackColor];
        self.result = [[NSMutableString alloc]initWithFormat:@"0"];
        flag = YES;
        int width = frame.size.width;
        int hight = frame.size.height;
        for (int i=0; i<5; i++){
            for (int j=0; j<4; j++) {
                //数字“0”
                if ((i==4) && (j==0)) {
                    button = [[UIButton alloc]initWithFrame:CGRectMake(j*(width/4), i*(hight/5), width/2, hight/5)];
                    button.backgroundColor = [UIColor lightGrayColor];
                    button.tag = (i+1)*10 + (j+1);
                    [button.layer setBorderWidth:1];
                    [button setTitle:@"0" forState:UIControlStateNormal];
                    [button addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
                    [self addSubview:button];
                    j++;
                    continue;
                }
                //初始化Button并设置相应tag
                button = [[UIButton alloc]initWithFrame:CGRectMake(j*(width/4), i*(hight/5), width/4, hight/5)];
                button.backgroundColor = [UIColor lightGrayColor];
                [button.layer setBorderWidth:1];
                button.tag = (i+1)*10 + (j+1);
            
                
                if((j+1)==4){
                    button.backgroundColor = [UIColor orangeColor];
                }
                [self addSubview:button];
                
                //给Button设置title，并做点击操作响应
                if (i>0 && j<3 && i<4) {
                    int num = (3-i)*3+(j+1);
                    NSString *b = [NSString stringWithFormat:@"%d",num];
                    [button setTitle:b forState:UIControlStateNormal];
                    [button addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
                }
                //设置"+","-","*","/"等操作
                switch (button.tag) {
                    case 11:
                        [button setTitle:@"C" forState:UIControlStateNormal];
                        [button addTarget:self action:@selector(cleanNum) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 12:
                        [button setTitle:@"+/-" forState:UIControlStateNormal];
                        [button addTarget:self action:@selector(symbol:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 13:
                        [button setTitle:@"%" forState:UIControlStateNormal];
                         [button addTarget:self action:@selector(percent:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 14:
                        [button setTitle:@"/" forState:UIControlStateNormal];
                        [button addTarget:self action:@selector(myOperate:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 24:
                        [button setTitle:@"x" forState:UIControlStateNormal];
                        [button addTarget:self action:@selector(myOperate:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 34:
                        [button setTitle:@"-" forState:UIControlStateNormal];
                        [button addTarget:self action:@selector(myOperate:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 44:
                        [button setTitle:@"+" forState:UIControlStateNormal];
                        [button addTarget:self action:@selector(myOperate:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 53:
                        [button setTitle:@"." forState:UIControlStateNormal];
                        [button addTarget:self action:@selector(decimal:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 54:
                        [button setTitle:@"=" forState:UIControlStateNormal];
                        [button addTarget:self action:@selector(Result) forControlEvents:UIControlEventTouchDown];
                        break;
                    default:
                        break;
                }
            }
        }
    }
    return self;
}

-(void)decimal:(UIButton *)btn{
    
    if ([self.result isEqualToString:@""]){
        [self.result appendString:@"0."];
    }
    else{
        [self.result appendString:@"."];
    }
}

//数字Button
-(void)number:(UIButton *)btn{
    if ([self.result isEqualToString:@"0"]){
        [self.result setString:@""];
       }
        [self.result appendString:btn.titleLabel.text];
        self.numb1=[self.result doubleValue];
        //这里是取到父视图，通过tag取到Label，但是注意一点，，通过tag取到的是视图对象，
        //先强制类型转换一下，然后用UILabel对象接收，这样就可以操作者的Label对象
        UILabel *l=(UILabel*)[[self superview] viewWithTag:1];
        l.text=self.result;
}

-(void)cleanNum{
    [self.result setString:@"0"];
    self.numb1=0;
    self.numb2=0;
    a=0;
    UILabel *l=(UILabel*)[[self superview] viewWithTag:1];
    l.text=self.result;
}
//运算符Button
-(void)myOperate:(UIButton *)btn{
    //在判断中用的是char类型，而按钮的text是string类型，需要先转换一下
    const char *operates = [btn.titleLabel.text UTF8String];
    char operate =operates[0];
    if (operate == 'x'){
        operate ='*';
    }
    //用到工厂来创建对象，oper是父类的对象，但是根据运算符的不同实例化出来子类对象
    oper = [OperateFactory createOperation:operate];
    self.numb2=[self.result doubleValue];
    [self.result setString:@""];
}

-(void)Result{
    if (a!=0&&self.numb2==0) {
        self.numb2=a;
        //判断如果运算完之后继续运算的话，用之前的结果当做第一个数
    }
    //为运算类的两个数赋值
    oper.number1=self.numb2;
    oper.number2=self.numb1;

    [self.result setString:[oper getResult]];
    [self clearZero];
    UILabel *l=(UILabel*)[[self superview] viewWithTag:1];
    l.text=self.result;
    a=[self.result doubleValue];
    [self.result setString:@""];
    self.numb2=0;
}


-(void)symbol:(UIButton*)btn
{
    if (a!=0&&[self.result isEqualToString:@""]) {
        self.numb1=a;
    }
    self.numb1= -self.numb1;
    [self.result setString:[NSString stringWithFormat:@"%f",self.numb1]];
    [self clearZero];
    UILabel *l=(UILabel*)[[self superview] viewWithTag:1];
    l.text=self.result;
    
}

-(void)percent:(UIButton*)btn
{
    if (a!=0&&[self.result isEqualToString:@""]) {
        self.numb1=a;
    }
    self.numb1=self.numb1*0.01;
    [self.result setString:[NSString stringWithFormat:@"%lf",self.numb1]];
    [self clearZero];
    UILabel *l=(UILabel*)[[self superview] viewWithTag:1];
    l.text=self.result;
}

-(void)clearZero
{
    for (int i=[self.result length]-1; i>=0; i--) {
        char c=[self.result characterAtIndex:i];
        switch (c) {
            case '0':
                [self.result deleteCharactersInRange:NSMakeRange(i, 1)];
                break;
            case '.':
                [self.result deleteCharactersInRange:NSMakeRange(i, 1)];
                goto end;
                break;
            default:
                goto end;
                break;
        }
    }
    end:;
}

@end
