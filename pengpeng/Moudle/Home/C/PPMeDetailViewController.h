//
//  PPMeDetailViewController.h
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPMeDetailViewController : PPBaseViewController<UINavigationControllerDelegate>
@property (nonatomic, strong)NSString *userId; //ch查看的这个人的id
@property (nonatomic, strong)SDCycleScrollView *headerView;
@end

NS_ASSUME_NONNULL_END
