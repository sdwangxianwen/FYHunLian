//
//  PPActivityModel.h
//  pengpeng
//
//  Created by wang on 2019/3/9.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPActivityListModel : PPBaseModel
@property (nonatomic,copy)NSString *activityPlace;
@property (nonatomic,copy)NSString *activityPoster; //活动图片
@property (nonatomic,copy)NSString *activityTheme;
@property (nonatomic,copy)NSString *activityState;
@property (nonatomic,copy)NSString *enterState;
@property (nonatomic,copy)NSString *startTime;
@property (nonatomic,copy)NSString *endTime;
@property (nonatomic,copy)NSString *manEnterNumber;
@property (nonatomic,copy)NSString *womenEnterNumber;
@property (nonatomic,copy)NSString *totalNumber;
@property (nonatomic,copy)NSString *totalManNumber;
@property (nonatomic,copy)NSString *totalWomenNumber;
@property (nonatomic,copy)NSString *activityType;
@property (nonatomic,copy)NSString *feeType;
@property (nonatomic,copy)NSString *fee;
@end

@interface PPActivityModel : PPBaseModel
@property (nonatomic, strong)NSArray<PPActivityListModel *>*list;
@end

NS_ASSUME_NONNULL_END

