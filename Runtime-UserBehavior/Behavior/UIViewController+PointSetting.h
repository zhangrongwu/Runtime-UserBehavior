//
//  UIViewController+PointSetting.h
//  Runtime-UserBehavior
//
//  Created by zhangrongwu on 2017/12/21.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PointSetting)
//   pageEvent必须是一个字典@{@"id":@"xxxx", @"enent":@""};
-(void)setPageEvent:(id)pageEvent;
@end
