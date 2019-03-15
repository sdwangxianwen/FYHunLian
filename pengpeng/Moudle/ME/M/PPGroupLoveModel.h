//
//  PPGroupLoveModel.h
//  pengpeng
//
//  Created by wang on 2019/3/11.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPGroupLoveModel : PPBaseModel
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *subTitle;
@property (nonatomic,copy)NSString *ImageName;
+(NSArray *)hongniangData;
@end

NS_ASSUME_NONNULL_END
