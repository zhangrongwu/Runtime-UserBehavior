//
//  UIButton+PointSetting.m
//  ICome
//
//  Created by zhangrongwu on 2017/12/21.
//  Copyright © 2017年 iCom. All rights reserved.
//

#import "UIButton+PointSetting.h"
#import "ICClickRecord.h"
#import <objc/runtime.h>

const char eventID;

@interface UIButton()

@property (nonatomic, strong)id event;

@end

@implementation UIButton (PointSetting)

// 打点相关
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents event:(id)event {
    [self addTarget:target action:action forControlEvents:controlEvents];
    [self setEvent:event];
}

-(void)setEvent:(id)event {
    objc_setAssociatedObject(self, &eventID, event, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)event {
    return objc_getAssociatedObject(self, &eventID);
}

-(void)beforeTouchUpInsideAction {
      NSLog(@"按钮打点事件 event 是一个测试对象 %@",[self event]);
    //#warning  在这里添加打点代码
    [ICClickRecord beginEvent:[self event]];
}
@end

