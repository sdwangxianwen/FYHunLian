//
//  PPUserChart.h
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPUserChart : NSObject
+(instancetype)share;
/**
 选择的性格的数组
 */
@property (nonatomic, strong)NSMutableArray *chartArrM;
@property (nonatomic, strong)NSMutableArray *hobbyArrM;
@end

NS_ASSUME_NONNULL_END
