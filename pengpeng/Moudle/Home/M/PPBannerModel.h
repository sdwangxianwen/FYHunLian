//
//  PPBannerModel.h
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPBannerModel : PPBaseModel
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *jumpId;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *imgUrl;
@property (nonatomic,copy)NSString *jumpUrl;
@property (nonatomic,copy)NSString *sort;
@property (nonatomic,copy)NSString *enable;
@property (nonatomic,copy)NSString *beginTime;
@property (nonatomic,copy)NSString *endTime;
@end


NS_ASSUME_NONNULL_END
