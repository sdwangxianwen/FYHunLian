//
//  PPQcCodeViewController.h
//  pengpeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPQcCodeViewController : PPBaseViewController

@end

@interface PPQcCodeSubViewController : PPBaseViewController<ZJScrollPageViewChildVcDelegate>
@property (nonatomic, strong)NSString *type; //1geren 2所有团体
@end
NS_ASSUME_NONNULL_END
