//
//  PPURL.h
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#ifndef PPURL_h
#define PPURL_h

#define kInDebugMode

#ifdef kInDebugMode
#define ROOT_URL @"http://192.168.1.22:2006/"
#define FYLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define FYLog(...)
#define ROOT_URL @"http://zuul.pploved.com/"
#endif


//MARK:登录注册
/**
 登录
 */
#define Login_url  [ROOT_URL stringByAppendingString:@"api/eas/registeredUserInfoByPass"]

//根据UserToken 获取用户权限信息
#define UserPermission [ROOT_URL stringByAppendingString:@"api/uer/getUserInfoByUserToken"]

/**
校验验证码
 */
#define ChecakCode [ROOT_URL stringByAppendingString:@"api/eas/accountNumberCheckVerificationCode"]
//发送手机验证码
#define SendPhoneCode_url  [ROOT_URL stringByAppendingString:@"api/send/sendSms"]
//发送邮箱验证码
#define SendMailCode_url  [ROOT_URL stringByAppendingString:@"api/send/sendMail"]
//登录后-完善信息-性格
#define GetMeTag_url [ROOT_URL stringByAppendingString:@"api/lab/getLabelByType"]
//完善信息
#define updateUserEntryInfo_url [ROOT_URL stringByAppendingString:@"api/uer/updateZxUserEntryInfo"]

//MARK:首页
//1,轮播图
#define HomeBanner [ROOT_URL stringByAppendingString:@"api/reco/getBannerList"]
//首页用户列表
#define HomeList [ROOT_URL stringByAppendingString:@"api/reco/getRecommendUserList"]
//我的基本资料
#define MeData_url [ROOT_URL stringByAppendingString:@"api/uer/getUserDetails"]

//修改喜欢/不喜欢状态
#define UpdateFriend_url [ROOT_URL stringByAppendingString:@"api/uer/updateUserLikeState"]

//MARK:活动
#define GetActivityList [ROOT_URL stringByAppendingString:@"api/mobile/act/getActivityList"]
//我的
#define Me_url [ROOT_URL stringByAppendingString:@"api/uer/getUserHome"]
//上传图片
#define UpdatePhoto_url [ROOT_URL stringByAppendingString:@"api/uplo/imgs"]
//获取行业
#define GetIndustry_url [ROOT_URL stringByAppendingString:@"api/asse/getIndustryAllJson"]
//获取职业
#define GetOccupation_url [ROOT_URL stringByAppendingString:@"api/asse/getOccupationByIndustryId"]
//获取爱情观列表
#define ZxQaProblem_url [ROOT_URL stringByAppendingString:@"api/lab/getZxQaProblem"]
//获取是否是企业管理状态
#define IsCompanyAdmin_url [ROOT_URL stringByAppendingString:@"api/grou/getGroupInfoAdminState"]
//企业红娘 团体红娘 高校红娘申请
#define AddGroupInfo_url [ROOT_URL stringByAppendingString:@"api/grou/addGroupInfo"]
//二维码
#define QR_url [ROOT_URL stringByAppendingString:@"api/invi/getUserInvitationQRCode"]

#pragma mark ----------------------------- 个人红娘
//我的队伍基本信息
#define MeTroopsInfo_url [ROOT_URL stringByAppendingString:@"api/matc/getMatchmakerInfoBymatchmakerUserId"]
//单身队伍，已婚队伍
#define TroopInfo_url  [ROOT_URL stringByAppendingString:@"api/matc/getMatchmakerRanksInfoBymatchmakerUserId"]

//企业红娘
#define GroupRanksUserByGroupId   [ROOT_URL stringByAppendingString:@"api/grou/getGroupRanksUserByGroupId"]
#define  GroupRanksInfoByGroupId  [ROOT_URL stringByAppendingString:@"api/grou/getGroupRanksInfoByGroupId"]
//队伍管理列表
#define TroopManager_url [ROOT_URL stringByAppendingString:@"api/grus/getGroupUserList"]

//我参与的活动
#define MeActivity_url [ROOT_URL stringByAppendingString:@"/api/mobile/act/user/getMyActivity"]
//喜欢我  我喜欢 知心人
#define Friend_url [ROOT_URL stringByAppendingString:@"api/uer/getUserLikeByType"]
//反馈
#define Feedback_url [ROOT_URL stringByAppendingString:@"api/asse/addZxFeedbackInfo"]

#endif /* PPURL_h */
