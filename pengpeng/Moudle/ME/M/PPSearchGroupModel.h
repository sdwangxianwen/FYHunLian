//
//  PPSearchGroupModel.h
//  pengpeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPSearchGroupModel : PPBaseModel

@property (nonatomic,copy) NSString *invitationQrCode;

@property (nonatomic,copy) NSString *type;

//企业名
@property (nonatomic,copy) NSString *name;

//联系人
@property (nonatomic,copy) NSString *linkMan;

//联系人电话
@property (nonatomic,copy) NSString *linkManPhone;

@property (nonatomic,copy) NSString *linkPhone;

@property (nonatomic,copy) NSString *address;

@property (nonatomic,copy) NSString *license;

@property (nonatomic,copy) NSString *logo;

@property (nonatomic,copy) NSString *userId;//企业的管理员Id


@property (nonatomic,copy) NSString *isCooperation;

@property (nonatomic,copy) NSString *inRanks; //与团体的关系 0未处理 1已加入 2没有加入

@property (nonatomic,copy) NSString *addTime;

@property (nonatomic,copy) NSString *updateTime;

@property (nonatomic,copy) NSString *ranksSize;
@end

NS_ASSUME_NONNULL_END
