//
//  Keyboard.h
//  CalculatorDemo
//
//  Created by 张鑫 on 16/3/23.
//  Copyright © 2016年 张鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OperateFactory.h"
@interface Keyboard : UIView
{
    UIButton *button;
}

@property(nonatomic,assign)double numb1;
@property(nonatomic,assign)double numb2;

@property(nonatomic,strong)NSMutableString *result;


-(id)initWithFrame:(CGRect)frame;

@end
