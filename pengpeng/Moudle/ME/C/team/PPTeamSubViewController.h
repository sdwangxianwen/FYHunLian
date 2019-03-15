//
//  PPTeamSubViewController.h
//  pengpeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseViewController.h"
#import "PPTeamHeaderView.h"

@protocol PPTeamSubViewControllerDelegate <NSObject>

-(void)seeMemberInfo:(NSString *)userid;
-(void)scorllHeight:(CGFloat)height;

@end

NS_ASSUME_NONNULL_BEGIN

@interface PPTeamSubViewController : UIViewController<JXCategoryListContentViewDelegate>
@property (nonatomic, weak)id<PPTeamSubViewControllerDelegate>delegate;
@property (nonatomic, strong)NSString *teamID;
@property (nonatomic, strong)NSString *teamType; //1单身2已婚
@property (nonatomic,assign)PPTeamType type;

@end

NS_ASSUME_NONNULL_END
