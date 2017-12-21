//
//  ViewController.m
//  Runtime-UserBehavior
//
//  Created by zhangrongwu on 2017/12/21.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+PointSetting.h"
#import "UIButton+PointSetting.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setPageEvent:@{@"key":@"viewController"}];
    
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(10, 55, 100, 50);
    [btn setTitle:@"发消息" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor cyanColor];
    [btn addTarget:self action:@selector(messageBtnClick) forControlEvents:UIControlEventTouchUpInside event:@{@"key":@"btn"}];
    [self.view addSubview:btn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)messageBtnClick{
    NSLog(@"发消息");
}


@end
