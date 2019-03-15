//
//  PPUserModel.h
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPUserModel : PPBaseModel
@property (nonatomic, strong)NSString *userId;
@property (nonatomic, strong)NSString *userToken;
@property (nonatomic, strong)NSString *rongYunToken;

@end

NS_ASSUME_NONNULL_END
