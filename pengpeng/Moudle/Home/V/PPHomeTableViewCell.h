//
//  PPHomeTableViewCell.h
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class PPHomeModel;
@interface PPHomeTableViewCell : UITableViewCell
@property (nonatomic, strong)PPHomeModel *homeModel;
@property (nonatomic, strong)UIImageView *headImageView;
@end

NS_ASSUME_NONNULL_END
