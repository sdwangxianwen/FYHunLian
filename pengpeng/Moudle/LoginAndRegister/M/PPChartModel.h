//
//  PPChartModel.h
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPChartModel : PPBaseModel
@property (nonatomic,copy)NSString *id;
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *info;
@property (nonatomic,assign)BOOL isSelected;
@end

NS_ASSUME_NONNULL_END
