//
//  OperateFactory.h
//  CalculatorDemo
//
//  Created by 张鑫 on 16/3/22.
//  Copyright © 2016年 张鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operate.h"
@interface OperateFactory : NSObject

+(id)createOperation:(char)operate;

@end
