//
//  PPTeamMainViewController.h
//  pengpeng
//
//  Created by wang on 2019/3/13.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseViewController.h"
#import "PPTeamBaseViewController.h"
#import "PPTeamHeaderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPTeamViewController : PPTeamBaseViewController
@property (nonatomic, strong)NSString *teamId; //
@property (nonatomic, assign)PPTeamType teamType;

@end

NS_ASSUME_NONNULL_END
