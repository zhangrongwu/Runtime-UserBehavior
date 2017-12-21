//
//  ICClickRecord.h
//  ICome
//
//  Created by zhangrongwu on 2017/6/28.
//  Copyright © 2017年 iCom. All rights reserved.
//  用户行为记录统计 ICClickRecord 通过与运行时结合完成简单数据统计

#import <Foundation/Foundation.h>

@interface ICClickRecord : NSObject
/** 当reportPolicy == SEND_INTERVAL 时设定log发送间隔
 @param second 单位为秒,最小90秒,最大86400秒(24hour).
 @return void.
 */
+ (void)setLogSendInterval:(double)second;

/** 自动页面时长统计, 开始记录某个页面展示时长.
 使用方法：必须配对调用beginLogPageView:和endLogPageView:两个函数来完成自动统计，若只调用某一个函数不会生成有效数据。
 在该页面展示时调用beginLogPageView:，当退出该页面时调用endLogPageView:
 @param pageName 统计的页面名称.
 @return void.
 */
+ (void)beginLogPageView:(id)info;

/** 自动页面时长统计, 结束记录某个页面展示时长.
 使用方法：必须配对调用beginLogPageView:和endLogPageView:两个函数来完成自动统计，若只调用某一个函数不会生成有效数据。
 在该页面展示时调用beginLogPageView:，当退出该页面时调用endLogPageView:
 @param pageName 统计的页面名称.
 @return void.
 */
+ (void)endLogPageView:(id)info;

/**
 事件开始
 */
+ (void)beginEvent:(id)info;
/**
 事件结束
 */
+ (void)endEvent:(id)info;

@end



