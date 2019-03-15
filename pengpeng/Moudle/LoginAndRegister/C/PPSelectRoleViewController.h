//
//  PPSelectRoleViewController.h
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPSelectRoleViewController : PPBaseViewController

@end
@class PPSelectRoleModel;
@interface PPSelectRoleCell : UITableViewCell
@property (nonatomic, strong)PPSelectRoleModel *model;
@end

NS_ASSUME_NONNULL_END
