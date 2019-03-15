//
//  PPLoveAlertView.h
//  pengpeng
//
//  Created by wang on 2019/3/11.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PPLoveModel;
NS_ASSUME_NONNULL_BEGIN
typedef void(^proBlock)(NSString *porblem);
@interface PPLoveAlertView : UIView
@property (nonatomic,copy)proBlock proBlock;
+(void)show:(proBlock)proBlock;
+(void)disMiss;
@end

@interface PPLoveAlertViewCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)PPLoveModel *model;


@end

NS_ASSUME_NONNULL_END
