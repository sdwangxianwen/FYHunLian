//
//  PPTeamViewController.h
//  pengpeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPTeamBaseViewController : PPBaseViewController<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>
@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) JXCategoryBaseView *categoryView;

@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;

@property (nonatomic, assign) BOOL isNeedIndicatorPositionChangeItem;

@property (nonatomic, assign) BOOL shouldHandleScreenEdgeGesture;

- (JXCategoryBaseView *)preferredCategoryView;

- (CGFloat)preferredCategoryViewHeight;

- (id<JXCategoryListContentViewDelegate>)preferredListAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
