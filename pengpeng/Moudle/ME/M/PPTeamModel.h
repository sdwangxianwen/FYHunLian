//
//  PPTeamModel.h
//  pengpeng
//
//  Created by wang on 2019/3/13.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPTeamModel :PPBaseModel
@property (nonatomic,copy) NSString *birthday;
@property (nonatomic,copy) NSString *headImg;
@property (nonatomic,assign) NSInteger inRanks; //与红娘的关系 0不在可以申请 1申请中 2在队伍,分型 3自己看自己不存在
@property (nonatomic,assign) NSInteger isMatchmaker;
@property (nonatomic,assign) NSInteger marriedSize; //结婚人数
@property (nonatomic,copy) NSString *matchmakerMsgNum;
@property (nonatomic,copy) NSString *matchmakerToken;
@property (nonatomic,assign) NSInteger ranksSize; //总人数
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,assign) NSInteger singleSize; //单身人数
@property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *userRoleStat;
@property (nonatomic,copy) NSString *zxUserInfoVos;

//企业的
@property (nonatomic,copy) NSString *groupId;
@property (nonatomic,copy) NSString *type; // 1,
@property (nonatomic,copy) NSString *name; // 企业名,
@property (nonatomic,copy) NSString *license; // url,
@property (nonatomic,copy) NSString *logo; // url,
@property (nonatomic,copy) NSString *addTime; // 1541733860000,
@property (nonatomic,copy) NSString *groupMsgNum; // 0,
@property (nonatomic,copy) NSString *groupUserToken; // 951acf6a1541580852649

@end

NS_ASSUME_NONNULL_END

@interface PPTeamMemberModel : PPBaseModel
@property (nonatomic,copy)NSString *userId;
@property (nonatomic,copy)NSString *mobilePhone;
@property (nonatomic,copy)NSString *userRoleStat;
@property (nonatomic,copy)NSString *isMatchmaker;
@property (nonatomic,copy)NSString *headImg;
@property (nonatomic,copy)NSString *userName;
@property (nonatomic,copy)NSString *sex;
@property (nonatomic,copy)NSString *birthday;
@property (nonatomic,copy)NSString *presentAddressId;
@property (nonatomic,copy)NSString *presentAddressStr;
@property (nonatomic,copy)NSString *showGroupName;
@property (nonatomic,copy)NSString *schoolId;
@property (nonatomic,copy)NSString *schoolName;
@property (nonatomic,copy)NSString *companyId;
@property (nonatomic,copy)NSString *companyName;
@property (nonatomic,copy)NSString *groupsId;
@property (nonatomic,copy)NSString *groupsName;

@end

@interface PPTeamManagerModel : PPBaseModel

@property (nonatomic,copy) NSString * birthday;

@property (nonatomic,copy) NSString * companyId;

@property (nonatomic,copy) NSString * companyName;

@property (nonatomic,copy) NSString * groupsId;

@property (nonatomic,copy) NSString * groupsName;

@property (nonatomic,copy) NSString * headImg;

@property (nonatomic,copy) NSString * isMatchmaker;

@property (nonatomic,copy) NSString * mobilePhone;

@property (nonatomic,copy) NSString * presentAddressId;

@property (nonatomic,copy) NSString * presentAddressStr;

@property (nonatomic,copy) NSString * schoolId;

@property (nonatomic,copy) NSString * schoolName;

@property (nonatomic,copy) NSString *sex;

@property (nonatomic,copy) NSString *showGroupName;

@property (nonatomic,copy) NSString *userId;

@property (nonatomic,copy) NSString *userName;

@property (nonatomic,copy) NSString *userRoleStat;

@end
