//
//  PPRegisterView.h
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^submitBlock)(NSString *account,NSString *code);
@interface PPRegisterView : UIView
@property (nonatomic,copy)submitBlock submitBlock;

@end

NS_ASSUME_NONNULL_END
