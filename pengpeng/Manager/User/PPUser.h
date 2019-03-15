//
//  PPUser.h
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPUser : NSObject

+(void)removeAll;

/**
 存userid
 */
+(void)saveUserID:(NSString *)userID;

/**
 q读取userid
 */
+(NSString *)readUserID;

/**
 存usertoken
 */
+(void)saveUserToken:(NSString *)userToken;
/**
 读取usertoken
 */
+(NSString *)readUserToken;

/**
 存rCIMTOKEN
 */
+(void)saveRcimToken:(NSString *)rcimToken;
/**
 读取usertoken
 */
+(NSString *)readRcimToken;

/**
 存用户填写的信息
 */
+(void)saveInputInfo;
+(NSString *)readInputInfo;

//处理首页地址
+(NSString *)showHomeAddress:(NSString *)address;

@end

NS_ASSUME_NONNULL_END
