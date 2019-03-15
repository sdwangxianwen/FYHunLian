//
//  PPTools.m
//  pengpeng
//
//  Created by wang on 2019/3/8.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPTools.h"

@implementation PPTools
+(NSString *)calculateAge:(NSString *)datestr {
    NSDate *nowDate = [NSDate date];
    NSTimeInterval time=[datestr doubleValue]/1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    NSDate *birthDay = [dateFormatter dateFromString:currentDateStr];
    NSCalendar *calendar = [NSCalendar currentCalendar];//定义一个NSCalendar对象
    //    //用来得到详细的时差
    unsigned int unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *date = [calendar components:unitFlags fromDate:birthDay toDate:nowDate options:0];
    NSString *ageStr = [NSString stringWithFormat:@"%ld",(long)[date year]];
    return ageStr;
}

+(NSString *)calculateTimeWtih:(NSString *)dateStr {
    NSTimeInterval time=[dateStr doubleValue]/1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"MM.dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    return currentDateStr;
}
@end
