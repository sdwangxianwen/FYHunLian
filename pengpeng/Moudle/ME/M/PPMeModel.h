//
//  PPMeModel.h
//  pengpeng
//
//  Created by wang on 2019/3/10.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPMeModel : PPBaseModel
@property (nonatomic,copy) NSString *headImg;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,copy) NSString *birthday;
@property (nonatomic,copy) NSString *showGroupName;
@property (nonatomic,copy) NSString *schoolId;
@property (nonatomic,copy) NSString *schoolName;
@property (nonatomic,copy) NSString *companyId;
@property (nonatomic,copy) NSString *companyName;
@property (nonatomic,copy) NSString *groupsId;
@property (nonatomic,copy) NSString *groupsName;
@property (nonatomic,assign)int kPMoney;
@property (nonatomic,assign)int dPMoney;
@property (nonatomic,copy) NSString *likeMeNewSize;
@property (nonatomic,copy) NSString *likeMeAllSize;
@property (nonatomic,copy) NSString *likeEachNewSize;
@property (nonatomic,copy) NSString *likeEachAllSize;
@property (nonatomic,copy) NSString *dynamicMsgNum;
@property (nonatomic,assign)int flowingSize;
@property (nonatomic,assign) int ranksSize;
@property (nonatomic,copy) NSString *ilikeNewSize;
@property (nonatomic,assign) int marriedSize;
@property (nonatomic,assign) int matchmakerApplyMsgNum;
@property (nonatomic,strong) NSString *userToken;
@property (nonatomic, assign) int groupApplyMsgNum;

@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *subTitle;
@property (nonatomic,assign)BOOL isSubtitle;
@property (nonatomic,assign)BOOL isIcon;

-(NSArray *)getThreeData;
-(NSArray *)getFourData;
@end

NS_ASSUME_NONNULL_END
