//
//  ICUserBehaviorInfo.h
//  ICome
//
//  Created by zhangrongwu on 2017/6/28.
//  Copyright © 2017年 iCom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICLKBaseManager.h"

@interface ICUserBehaviorInfo : ICLKBaseManager
@property (nonatomic, assign)int ID;

@property (nonatomic, assign)int type;
@property (nonatomic, assign)long time;
@property (nonatomic, strong)NSDictionary *data;

+ (void)updateUserEvent;

@end
