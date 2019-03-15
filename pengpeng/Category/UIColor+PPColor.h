//
//  UIColor+PPColor.h
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//




#import <UIKit/UIKit.h>
@interface UIColor (PPColor)
+ (instancetype)colorWithHex:(uint32_t)hex;
+ (instancetype)colorRandom; //随机颜色
@end


