//
//  PPActivityModel.m
//  pengpeng
//
//  Created by wang on 2019/3/9.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPActivityModel.h"

@implementation PPActivityListModel

@end

@implementation PPActivityModel

+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"list":[PPActivityListModel class],
             };
    
}

@end
