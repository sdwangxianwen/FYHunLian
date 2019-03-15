//
//  PPEditModel.h
//  pengpeng
//
//  Created by wang on 2019/3/10.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPEditModel : PPBaseModel
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *imageName;
@property (nonatomic,copy)NSString *subTitle;
+(NSArray *)getSectionData;
+(NSArray *)getZiliaoData;
+(NSArray *)getJingliData;
+(NSArray *)getLifeData;
@end

NS_ASSUME_NONNULL_END
