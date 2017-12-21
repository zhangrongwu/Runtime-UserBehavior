//
//  UIButton+PointSetting.h
//  Runtime-UserBehavior
//
//  Created by zhangrongwu on 2017/12/21.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (PointSetting)
// 开发者使用
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents event:(id)event;

// sdk内部调用
-(NSString *)event;
-(void)beforeTouchUpInsideAction;
@end
