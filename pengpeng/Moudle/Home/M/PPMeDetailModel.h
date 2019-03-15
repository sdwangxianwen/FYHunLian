//
//  PPMeDetailModel.h
//  pengpeng
//
//  Created by wang on 2019/3/8.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface zxUserMatchmaker :PPBaseModel

@property (nonatomic,copy) NSString *mobilePhone;
@property (nonatomic,copy) NSString *isMatchmaker;
@property (nonatomic,copy) NSString *headImg;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,copy) NSString *birthday;
@property (nonatomic,copy) NSString *presentAddressId;
@property (nonatomic,copy) NSString *presentAddressStr;
@property (nonatomic,copy) NSString *showGroupName;
@property (nonatomic,copy) NSString *schoolId;
@property (nonatomic,copy) NSString *schoolName;
@property (nonatomic,copy) NSString *companyId;
@property (nonatomic,copy) NSString *companyName;
@property (nonatomic,copy) NSString *groupsId;
@property (nonatomic,copy) NSString *groupsName;
@property (nonatomic,copy) NSString *userRoleStat;
@property (nonatomic,copy) NSString *guarantState;
@property (nonatomic,copy) NSString *matchmakerId;
@property (nonatomic,copy) NSString *matchmakerTime;
@property (nonatomic,copy) NSString *isRootUser;
@property (nonatomic,copy) NSString *isPUser;
@property (nonatomic,copy) NSString *lastLoginTime;
@property (nonatomic,copy) NSString *lastLoginIp;
@property (nonatomic,copy) NSString *addTime;
@property (nonatomic,copy) NSString *updateTime;
@end

@interface zxGroupInfo : PPBaseModel

@property (nonatomic,copy) NSString * invitationQrCode;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *linkMan;
@property (nonatomic,copy) NSString *linkManPhone;
@property (nonatomic,copy) NSString *linkPhone;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *license;
@property (nonatomic,copy) NSString *logo;
@property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *isCooperation;
@property (nonatomic,copy) NSString *addTime;
@property (nonatomic,copy) NSString *updateTime;
@property (nonatomic,copy) NSString *ranksSize;
@property (nonatomic,copy) NSString *inRanks; // 判断是不是团体管理员 1表示管理员 3成员
@end

@interface zxUserDetailsModel : PPBaseModel
@property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *invitationQrCode; //个人二维码
@property (nonatomic,copy) NSString *maritalStatus; //0 未婚。 1 已婚
@property (nonatomic,copy) NSString *haveChildren;  //0 没有孩子 1 有孩子
@property (nonatomic,copy) NSString *modifyNum; //基本信息修改次数
@property (nonatomic,copy) NSString *constellationId;//星座ID
@property (nonatomic,copy) NSString *constellation;//星座
@property (nonatomic,copy) NSString *height; ///身高
@property (nonatomic,copy) NSString *weight; //体重
@property (nonatomic,copy) NSString *bloodType; //血型
@property (nonatomic,copy) NSString *declaration; //表白宣言
@property (nonatomic,copy) NSString *occupationId; //行业ID
@property (nonatomic,copy) NSString *occupation; //行业
@property (nonatomic,copy) NSString *positionId; //职位ID
@property (nonatomic,copy) NSString *position; //职位
@property (nonatomic,copy) NSString *schoolId;
@property (nonatomic,copy) NSString *school;
@property (nonatomic,copy) NSString *workingState;
@property (nonatomic,copy) NSString *education; //0 专科 1 本科 2 研究生 3 博士
@property (nonatomic,copy) NSString *income;  //收入
@property (nonatomic,copy) NSString *registeredAddress; //户口所在地
@property (nonatomic,copy) NSString *haveHouse; //是否购房 0 没有购房 1 购房
@property (nonatomic,copy) NSString *haveCar;  //是否h购车 0 没有购车 1 够车
@property (nonatomic,copy) NSString *updateTime;  //
@end

@interface zxUserDetailsImgsModel : PPBaseModel
@property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *imgUrl;
@property (nonatomic,copy) NSString *imgSort;
@property (nonatomic,copy) NSString *updateTime;
@end

@interface zxUserHobbyModel : PPBaseModel
@property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *hobbyJson;
@property (nonatomic,assign)NSInteger height;
@end

@interface zxUser : PPBaseModel
@property (nonatomic,copy) NSString *mobilePhone;
@property (nonatomic,copy) NSString *isMatchmaker;
@property (nonatomic,copy) NSString *headImg;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,copy) NSString *birthday;
@property (nonatomic,copy) NSString *presentAddressId;
@property (nonatomic,copy) NSString *presentAddressStr;//现居地
@property (nonatomic,copy) NSString *showGroupName;
@property (nonatomic,copy) NSString *schoolId;
@property (nonatomic,copy) NSString *schoolName;//毕业原系哦啊哦
@property (nonatomic,copy) NSString *companyId;
@property (nonatomic,copy) NSString *companyName;
@property (nonatomic,copy) NSString *groupsId;
@property (nonatomic,copy) NSString *groupsName;
@property (nonatomic,copy) NSString *userRoleStat;
@property (nonatomic,copy) NSString *guarantState;
@property (nonatomic,copy) NSString *matchmakerId;
@property (nonatomic,copy) NSString *isRootUser;
@property (nonatomic,copy) NSString *isPUser;
@property (nonatomic,copy) NSString *lastLoginTime;
@property (nonatomic,copy) NSString *lastLoginIp;
@property (nonatomic,copy) NSString *addTime;
@property (nonatomic,copy) NSString *updateTime;
@end

@interface zxUserCharacterModel : PPBaseModel
@property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *characterJson;
@end

@interface zxQuestionModel : PPBaseModel
@property (nonatomic,copy) NSString *userId;
@property (nonatomic,assign) BOOL type;
@property (nonatomic,copy) NSString *answerStr;
@property (nonatomic,copy) NSString *problemStr;
@property (nonatomic,copy) NSString *updateTime;
@end

@interface PPMeDetailModel : PPBaseModel

@property (nonatomic,copy) NSString *likeState;  //喜欢状态 0 互相不喜欢 1互相喜欢 2 我喜欢他 3 他喜欢我
@property (nonatomic,copy) NSString *matchmakerType; // 0 解析红娘信息 1 解析团体信息 2 暂无
@property (nonatomic,strong) zxGroupInfo *zxGroupInfo; //团体信息
@property (nonatomic,strong) zxUser *zxUser;
@property (nonatomic,strong) zxUserCharacterModel *zxUserCharacter;
@property (nonatomic,strong) zxUserDetailsModel *zxUserDetails;
@property (nonatomic,strong) NSArray <zxUserDetailsImgsModel *>*zxUserDetailsImgs; //背景墙
@property (nonatomic,strong) zxUserHobbyModel *zxUserHobby; // 爱好
@property (nonatomic,strong) zxUserMatchmaker *zxUserMatchmaker;
@property (nonatomic,strong) NSArray <zxQuestionModel *>*zxUserQas;

@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *subTitle;




@end

@interface PPMeDetailSectionModel : PPBaseModel;
@property (nonatomic,copy)NSString *iamgeName;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *subTitle;
@property (nonatomic, strong)PPMeDetailModel *medetailModel;
+(NSArray *)getSectionData;

-(NSArray *)getZiliaoData; //基本资料
-(NSArray *)getJingliData;//经历
-(NSArray *)getLifeData; //生活
//-(NSArray *)getZeouData; //择偶标砖 暂时没有



@end

NS_ASSUME_NONNULL_END
