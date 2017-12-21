//
//  NSDate+Extension.m
//  Runtime-UserBehavior
//
//  Created by zhangrongwu on 2017/12/21.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)
+(long)longFromDate:(NSDate*)date{
    return [date timeIntervalSince1970] * 1000;
}
@end
