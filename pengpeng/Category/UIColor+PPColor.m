//
//  UIColor+PPColor.m
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import "UIColor+PPColor.h"

@implementation UIColor (PPColor)

+ (instancetype)colorWithHex:(uint32_t)hex{
    int red = (hex & 0xFF0000) >> 16;
    int green = (hex & 0x00FF00) >> 8;
    int blue = (hex & 0x0000FF);
    
    return [UIColor colorWithR:red G:green B:blue alpha:1];
}
+ (instancetype)colorWithR:(int)red G:(int)green B:(int)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}
+ (instancetype)colorRandom {
    return [UIColor colorWithR:arc4random_uniform(256) G:arc4random_uniform(256) B:arc4random_uniform(256) alpha:1];
}

@end
