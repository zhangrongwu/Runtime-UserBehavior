//
//  ICApplication.m
//  ICome
//
//  Created by zhangrongwu on 2017/6/26.
//  Copyright © 2017年 iCom. All rights reserved.
//

#import "ICApplication.h"
#import "UIButton+PointSetting.h"

@implementation ICApplication
-(BOOL)sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event {
    if ([sender isMemberOfClass:[UIButton class]]) {
        if ([sender event]) {
            [sender beforeTouchUpInsideAction];
        }
    }
    [super sendAction:action to:target from:sender forEvent:event];
    return YES;
}

@end
