//
//  PPCodeModel.h
//  pengpeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPCodeModel : PPBaseModel
@property (nonatomic,copy) NSString *enterpriseQRCode;
@property (nonatomic,copy) NSString *groupRCode;
@property (nonatomic,copy) NSString *personalQRCode;
@property (nonatomic,copy) NSString *schoolQRCode;
@end

NS_ASSUME_NONNULL_END
