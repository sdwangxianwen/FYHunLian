//
//  UIView+FYExtension.h
//  FYAlertView
//
//  Created by wang on 2018/8/2.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PPBaseViewController;
@interface UIView (FYExtension)
@property (nonatomic, assign) CGFloat fy_x;
@property (nonatomic, assign) CGFloat fy_y;
@property (nonatomic, assign) CGFloat fy_width;
@property (nonatomic, assign) CGFloat fy_height;
@property (nonatomic, assign) CGFloat fy_centerX;
@property (nonatomic, assign) CGFloat fy_centerY;
@property (nonatomic, assign) CGSize  fy_size;
@property (nonatomic, assign) CGPoint fy_origin;
@property (nonatomic, assign, readonly) CGFloat fy_maxX;
@property (nonatomic, assign, readonly) CGFloat fy_minX;
@property (nonatomic, assign, readonly) CGFloat fy_maxY;
@property (nonatomic, assign, readonly) CGFloat fy_minY;

- (PPBaseViewController *)getCurrentViewController;

@end
