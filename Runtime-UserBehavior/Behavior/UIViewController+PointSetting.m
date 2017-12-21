//
//  UIViewController+PointSetting.m
//  ICome
//
//  Created by zhangrongwu on 2017/6/26.
//  Copyright © 2017年 iCom. All rights reserved.
//

#import "UIViewController+PointSetting.h"
#import "ICClickRecord.h"
#import "UMMobClick/MobClick.h"
#import <objc/runtime.h>


static const char pageEventID;

@interface UIViewController()
@property (assign, nonatomic) id pageEvent;

@end

@implementation UIViewController (PointSetting)

+(void)load {
    Method orignalMethodViewWillAppear = class_getInstanceMethod([UIViewController class], @selector(viewWillAppear:));
    Method orignalMethodViewWillDisAppear = class_getInstanceMethod([UIViewController class], @selector(viewWillDisappear:));
    Method swapMethodViewWillAppear = class_getInstanceMethod([UIViewController class], @selector(myViewWillAppear));
    Method swapMethodViewWillDisAppear = class_getInstanceMethod([UIViewController class], @selector(myViewWillDisAppear));
    
    method_exchangeImplementations(orignalMethodViewWillAppear, swapMethodViewWillAppear);
    method_exchangeImplementations(orignalMethodViewWillDisAppear, swapMethodViewWillDisAppear);
}

-(void)setPageEvent:(id)pageEvent {
    objc_setAssociatedObject(self, &pageEventID, pageEvent, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)pageEvent {
    return objc_getAssociatedObject(self, &pageEventID);
}

-(void)myViewWillAppear {
    // 自定统计
    id pageEvent = [self pageEvent];
    if (pageEvent) {
        NSLog(@"进入页面打点开始 %@",[self pageEvent]);
        //#warning 页面统计开始代码
        [ICClickRecord beginLogPageView:pageEvent];
    }
    [self myViewWillAppear];
    
    // 友盟统计
    if (!self.title) {
        [MobClick beginLogPageView:self.title];
    } else {
        [MobClick beginLogPageView:NSStringFromClass([self class])];
    }
}

-(void)myViewWillDisAppear {
    id pageEvent = [self pageEvent];
    if (pageEvent) {
        NSLog(@"退出页面打点结束 %@",[self pageEvent]);
        //#warning 页面统计结束代码
        [ICClickRecord endLogPageView:pageEvent];
    }
    [self myViewWillDisAppear];
    
    if (!self.title) {
        [MobClick endLogPageView:self.title];
    } else {
        [MobClick endLogPageView:NSStringFromClass([self class])];
    }
}

@end

