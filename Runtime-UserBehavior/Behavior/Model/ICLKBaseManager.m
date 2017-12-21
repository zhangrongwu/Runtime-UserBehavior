//
//  ICLKBaseManager.m
//  ICome
//
//  Created by zhangrongwu on 2017/6/14.
//  Copyright © 2017年 iCom. All rights reserved.
//

#import "ICLKBaseManager.h"

@implementation ICLKBaseManager
// 重写
+(LKDBHelper *)getUsingLKDBHelper
{
    static LKDBHelper* db;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString* dbpath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"UserDB.db"];
        
        db = [[LKDBHelper alloc]initWithDBPath:dbpath];
    });
    return db;
}

@end
