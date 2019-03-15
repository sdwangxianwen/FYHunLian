//
//  PPLoveListModel.h
//  pengpeng
//
//  Created by wang on 2019/3/14.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPLoveListModel : PPBaseModel
@property (nonatomic,copy)NSString *userId;  // 42,用户ID<number>
@property (nonatomic,copy)NSString *mobilePhone;  // 13718695412,手机号<string>
@property (nonatomic,copy)NSString *userRoleStat;  // null,权限状态<string>
@property (nonatomic,copy)NSString *isMatchmaker;  // 1,#注释<number>
@property (nonatomic,copy)NSString *headImg;  // null,#注释<string>
@property (nonatomic,copy)NSString *userName;  // 船长,昵称<string>
@property (nonatomic,copy)NSString *sex;  // 1,性别<number>
@property (nonatomic,copy)NSString *birthday;  // 971157600000,生日<number>
@property (nonatomic,copy)NSString *presentAddressId;  // null,#注释<string>
@property (nonatomic,copy)NSString *presentAddressStr;  // null,#注释<string>
@property (nonatomic,copy)NSString *showGroupName;  // null,#注释<string>
@property (nonatomic,copy)NSString *schoolId;  // null,#注释<string>
@property (nonatomic,copy)NSString *schoolName;  // null,#注释<string>
@property (nonatomic,copy)NSString *companyId;  // null,#注释<string>
@property (nonatomic,copy)NSString *companyName;  // null,#注释<string>
@property (nonatomic,copy)NSString *groupsId;  // null,#注释<string>
@property (nonatomic,copy)NSString *groupsName;  // null#注释<string>

@end

NS_ASSUME_NONNULL_END
