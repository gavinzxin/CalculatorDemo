//
//  ViewController.m
//  CalculatorDemo
//
//  Created by 张鑫 on 16/3/22.
//  Copyright © 2016年 张鑫. All rights reserved.
//

#import "ViewController.h"
#import "Keyboard.h"
@interface ViewController ()
{
    UILabel *showResult;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    int width = [[UIScreen mainScreen] bounds].size.width;
    int height = [[UIScreen mainScreen] bounds].size.height;
    
    showResult = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 200)];
    showResult.backgroundColor = [UIColor darkGrayColor];
    showResult.tag = 1;
    [showResult setTextAlignment:NSTextAlignmentRight];
    [showResult setFont:[UIFont systemFontOfSize:40]];
    
    [self.view addSubview:showResult];
     
    Keyboard *key=[[Keyboard alloc]initWithFrame:CGRectMake(0, 200, width, height-200)];
    [self.view addSubview:key];
    showResult.text =[NSString stringWithFormat:@"%@",key.result];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
