//
//  PPUserPermissionsModel.h
//  pengpeng
//
//  Created by wang on 2019/3/13.
//  Copyright © 2019 wang. All rights reserved.
//用户权限

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPUserPermissionsModel : PPBaseModel
@property (nonatomic,copy) NSString *mobilePhone;  // 17600690039,用户手机号<string>
@property (nonatomic,copy) NSString *isMatchmaker;  // null,红娘角色 1单身 2单身红娘 3已婚红娘<string>
@property (nonatomic,copy) NSString *headImg;  // null,头像<string>
@property (nonatomic,copy) NSString *userName;  // null,用户名(姓名)<string>
@property (nonatomic,copy) NSString *sex;  // null,性别 0女 1男<string>
@property (nonatomic,copy) NSString *birthday;  // null,生日 时间戳<string>
@property (nonatomic,copy) NSString *presentAddressId;  // null,现居地址ID<string>
@property (nonatomic,copy) NSString *presentAddressStr;  // null,现居地址文本<string>
@property (nonatomic,copy) NSString *schoolId;  // null,背书学校Id<string>
@property (nonatomic,copy) NSString *schoolName;  // null,背书学校名称<string>
@property (nonatomic,copy) NSString *companyId;  // null,背书公司Id<string>
@property (nonatomic,copy) NSString *companyName;  // null,背书公司名称<string>
@property (nonatomic,copy) NSString *groupsId;  // null,背书团体ID<string>
@property (nonatomic,copy) NSString *groupsName;  // null,背书团体名称<string>
@property (nonatomic,copy) NSString *userRoleStat;  // 2,用户权限状态 1用户 2游客 3系统黑名单<number>
@property (nonatomic,copy) NSString *guarantState;  // 0,背书状态 0没有背书 1红娘背书 2团体背书 3红娘加团体背书'<number>
@property (nonatomic,copy) NSString *matchmakerId;  // null,背书的红娘ID (种子用户的红娘是自己)<string>
@property (nonatomic,copy) NSString *isRootUser;  // 0,1是 0不是(判断红娘是不是自己)<number>
@property (nonatomic,copy) NSString *isPUser;  // 2,用户来源 1公众号 2APP注册用户 3套路用户<number>
@property (nonatomic,copy) NSString *lastLoginTime;  // null,最后活跃时间<string>
@property (nonatomic,copy) NSString *lastLoginIp;  // null,最后活跃IP<string>
@property (nonatomic,copy) NSString *addTime;  // 1540351872000,数据添加时间<number>
@property (nonatomic,copy) NSString *updateTime;  // 1540351872000数据最后修改时间<number>
@end

NS_ASSUME_NONNULL_END


