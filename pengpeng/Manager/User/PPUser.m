//
//  PPUser.m
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPUser.h"

@implementation PPUser

+(void)saveUserID:(NSString *)userID {
    [[NSUserDefaults standardUserDefaults] setObject:userID forKey:USERID];
}
+(NSString *)readUserID {
    return [[NSUserDefaults standardUserDefaults] objectForKey:USERID];
}

+(void)saveUserToken:(NSString *)userToken {
    [[NSUserDefaults standardUserDefaults] setObject:userToken forKey:USERTOKEN];
}
+(NSString *)readUserToken {
     return [[NSUserDefaults standardUserDefaults] objectForKey:USERTOKEN];
}
+(void)saveRcimToken:(NSString *)rcimToken {
    [[NSUserDefaults standardUserDefaults] setObject:rcimToken forKey:RCIMTOKEN];
}
+(NSString *)readRcimToken {
    return [[NSUserDefaults standardUserDefaults] objectForKey:RCIMTOKEN];
}
+(void)saveInputInfo {
    [[NSUserDefaults standardUserDefaults] setObject:@"inputinfo" forKey:@"inputinfo"];
}
+(NSString *)readInputInfo {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"inputinfo"];
}
+(void)removeAll {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERID];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERTOKEN];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:RCIMTOKEN];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"inputinfo"];
}

//处理首页地址
+(NSString *)showHomeAddress:(NSString *)address {
    NSArray *array = [address componentsSeparatedByString:@","]; //从字符A中分隔成2个元素的数组
    NSString *province = @"";
    NSString *city = @"";
    NSString *county = @"";
    if (array.count == 2) {
        province = array[0];
        city = array[1];
        if ([province isEqualToString:city]) {
            address = [NSString stringWithFormat:@"%@",province];
            return address;
        }else {
            address = [NSString stringWithFormat:@"%@ %@",province,city];
            return address;
        }
    }else if (array.count == 3) {
        province = array[0];
        city = array[1];
        county = array[2];
        if ([province isEqualToString:city]) {
            address = [NSString stringWithFormat:@"%@ %@",province,county];
            return address;
        }else {
            address = [NSString stringWithFormat:@"%@ %@ %@",province,city,county];
            return address;
        }
    }else if (array.count == 4) {
        province = array[0];
        city = array[1];
        county = array[2];
        if ([province isEqualToString:city]) {
            address = [NSString stringWithFormat:@"%@ %@",province,county];
            return address;
        }else {
            address = [NSString stringWithFormat:@"%@ %@ %@",province,city,county];
            return address;
        }
    }
    return @"";
}
@end
