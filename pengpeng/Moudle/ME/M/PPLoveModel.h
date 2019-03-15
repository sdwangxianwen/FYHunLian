//
//  PPLoveModel.h
//  pengpeng
//
//  Created by wang on 2019/3/11.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPLoveModel : PPBaseModel
@property (nonatomic,copy)NSString  *problemTitle;
@property (nonatomic,copy)NSString *problemInfo;
@property (nonatomic,copy)NSString *sort;
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *answer;
@end

NS_ASSUME_NONNULL_END
