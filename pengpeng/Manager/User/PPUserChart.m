//
//  PPUserChart.m
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPUserChart.h"

@implementation PPUserChart
+(instancetype)share {
    static PPUserChart *chart = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!chart) {
            chart = [[PPUserChart alloc] init];
        }
    });
    return chart;
}
-(NSMutableArray *)chartArrM {
    if (!_chartArrM) {
        _chartArrM = [NSMutableArray array];
    }
    return _chartArrM;
}
-(NSMutableArray *)hobbyArrM {
    if (!_hobbyArrM) {
        _hobbyArrM = [NSMutableArray array];
    }
    return _hobbyArrM;
}
@end
