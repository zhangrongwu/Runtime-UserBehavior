//
//  ICClickRecord.m
//  ICome
//
//  Created by zhangrongwu on 2017/6/28.
//  Copyright © 2017年 iCom. All rights reserved.
//  

#import "ICClickRecord.h"
#import "ICUserBehaviorInfo.h"
#import "NSDate+Extension.h"
#import "MJExtension.h"
@implementation ICClickRecord


+ (void)setLogSendInterval:(double)second {
    
}

/** 自动页面时长统计, 开始记录某个页面展示时长.
 使用方法：必须配对调用beginLogPageView:和endLogPageView:两个函数来完成自动统计，若只调用某一个函数不会生成有效数据。
 在该页面展示时调用beginLogPageView:，当退出该页面时调用endLogPageView:
 @param pageName 统计的页面名称.
 @return void.
 */
+ (void)beginLogPageView:(id)info {
    NSLog(@"%s发送到服务器%@",__FUNCTION__,info);
    ICUserBehaviorInfo *event = [ICUserBehaviorInfo mj_objectWithKeyValues:info];
    event.time = [NSDate longFromDate:[NSDate date]];
    [event saveToDB];
}

/** 自动页面时长统计, 结束记录某个页面展示时长.
 使用方法：必须配对调用beginLogPageView:和endLogPageView:两个函数来完成自动统计，若只调用某一个函数不会生成有效数据。
 在该页面展示时调用beginLogPageView:，当退出该页面时调用endLogPageView:
 @param pageName 统计的页面名称.
 @return void.
 */
+ (void)endLogPageView:(id)info {
    
    NSLog(@"%s发送到服务器%@",__FUNCTION__,info);
    ICUserBehaviorInfo *event = [ICUserBehaviorInfo mj_objectWithKeyValues:info];
    event.time = [NSDate longFromDate:[NSDate date]];
    [event saveToDB];
}

/**
 事件开始
 */
+ (void)beginEvent:(id)info {
    NSLog(@"发送到服务器%@", info);
    ICUserBehaviorInfo *event = [ICUserBehaviorInfo mj_objectWithKeyValues:info];
    event.time = [NSDate longFromDate:[NSDate date]];
    [event saveToDB];
}
/**
 事件结束
 */
+ (void)endEvent:(id)info {
    NSLog(@"发送到服务器%@", info);
}


@end
