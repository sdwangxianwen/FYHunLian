//
//  PPSelectRoleModel.m
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPSelectRoleModel.h"

@implementation PPSelectRoleModel
+(NSArray *)getRoleInfo {
    return @[@{@"title":@"单身贵族",
               @"subTitle":@"也能在“我的”模块做红娘",
               @"imageName":@"login_roleSingle",
               @"ID":@"1"
               },
             @{@"title":@"人人红娘",
               @"subTitle":@"已婚的人士做红娘",
               @"imageName":@"login_roleDouble",
               @"ID":@"2"}];
}
@end
