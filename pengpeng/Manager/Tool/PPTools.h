//
//  PPTools.h
//  pengpeng
//
//  Created by wang on 2019/3/8.
//  Copyright © 2019 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPTools : NSObject
//通过时间戳计算年龄
+(NSString *)calculateAge:(NSString *)datestr;
//通过时间戳转换成时间（月.日）
+(NSString *)calculateTimeWtih:(NSString *)dateStr;
@end

NS_ASSUME_NONNULL_END
