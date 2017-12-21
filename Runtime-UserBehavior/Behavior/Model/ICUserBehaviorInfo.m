//
//  ICUserBehaviorInfo.m
//  ICome
//
//  Created by zhangrongwu on 2017/6/28.
//  Copyright © 2017年 iCom. All rights reserved.
//

#import "ICUserBehaviorInfo.h"
#import "LKDBHelper.h"
//#import "ICBehaviorNetworkManager.h"

@implementation ICUserBehaviorInfo

+ (void)updateUserEvent {
    LKDBHelper* globalHelper = [ICUserBehaviorInfo getUsingLKDBHelper];
    NSMutableArray *events = [globalHelper search:[ICUserBehaviorInfo class] where:nil orderBy:@"id desc" offset:0 count:200];
    NSMutableArray *list = [[NSMutableArray alloc] init];
//    for (ICUserBehaviorInfo *event in events) {
//        [list addObject:[event mj_keyValues]];
//    }
    // 发送用户行为记录
//    [[ICBehaviorNetworkManager sharedInstance] uploadUserBehaviorRecod:nil success:^(id object) {
//
//    } failure:nil];
}

+(NSString *)getPrimaryKey
{
    return @"ID";
}

///复合主键  这个优先级最高

//+(NSArray *)getPrimaryKeyUnionArray
//{
//    return @[@"ID",@"accountId"];
//}

//表名
+(NSString *)getTableName
{
    return @"ic_event";
}
@end
