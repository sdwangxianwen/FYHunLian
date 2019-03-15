//
//  PPMeDetailModel.m
//  pengpeng
//
//  Created by wang on 2019/3/8.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPMeDetailModel.h"

@implementation zxUserMatchmaker

@end

@implementation zxGroupInfo

@end

@implementation zxUserDetailsImgsModel

@end

@implementation zxUserDetailsModel

@end

@implementation zxUserCharacterModel

@end

@implementation zxUser

@end

@implementation zxQuestionModel

@end
@implementation zxUserHobbyModel

@end

@implementation PPMeDetailModel
+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"zxUserMatchmaker":[zxUserMatchmaker class],
             @"zxGroupInfo":[zxGroupInfo class],
             @"zxUserDetailsImgs":[zxUserDetailsImgsModel class],
             @"zxUserDetails":[NSUserDefaults class],
             @"zxUserCharacter":[zxUserCharacterModel class],
             @"zxUser":[zxUser class],
             @"zxUserQas":[zxQuestionModel class],
             @"zxUserHobby":[zxUserHobbyModel class],
             };
    
}



@end


@implementation PPMeDetailSectionModel

+(NSArray *)getSectionData {
    return @[@{@"iamgeName" :@"",@"title": @""},
             @{@"iamgeName" :@"me_love",@"title": @"我的红娘"},
             @{@"iamgeName" :@"me_ziliao",@"title": @"基本资料"},
             @{@"iamgeName" :@"me_hobby",@"title": @"爱好"},
             @{@"iamgeName" :@"me_xingge",@"title": @"性格"},
             @{@"iamgeName" :@"me_jingli",@"title": @"经历"},
             @{@"iamgeName" :@"me_life",@"title": @"生活"},
//             @{@"iamgeName" :@"me_biaozhun",@"title": @"择偶标准"},//暂时没有
             @{@"iamgeName" :@"me_liaoliao",@"title": @"聊聊爱情"}];
}



-(NSArray *)getLifeData {
    NSString *hunyin = @"";
    //0未婚1已婚2离异3丧偶
    if ([self.medetailModel.zxUserDetails.maritalStatus integerValue] == 0) {
        hunyin = @"未婚";
    } else if ([self.medetailModel.zxUserDetails.maritalStatus integerValue] == 1) {
        hunyin = @"已婚";
    } else if ([self.medetailModel.zxUserDetails.maritalStatus integerValue] == 2) {
        hunyin = @"离异";
    } else if ([self.medetailModel.zxUserDetails.maritalStatus integerValue] == 3) {
        hunyin = @"丧偶";
    }
    NSString *child = @"";
    if ([self.medetailModel.zxUserDetails.haveChildren integerValue] == 0) {
        child = @"无子女";
    } else {
        child = @"有孩子";
    }
    NSString *car = @"";
    if ([self.medetailModel.zxUserDetails.haveCar integerValue] == 0) {
        car = @"无";
    } else {
        car = @"有";
    }
    
    NSString *house = @"";
    if ([self.medetailModel.zxUserDetails.haveHouse integerValue] == 0) {
        house = @"无";
    } else {
        house = @"有";
    }
    return @[@{@"title" : @"婚姻状况:",
               @"subTitle":hunyin},
             @{@"title" : @"生活状况:",
               @"subTitle":child},
             @{@"title" : @"是否有车:",
               @"subTitle":car},
             @{@"title" : @"是否有房:",
               @"subTitle":house},
             ];
}

-(NSArray *)getZiliaoData {
    NSString *height = self.medetailModel.zxUserDetails.height ? : @"--";
    NSString *weight = self.medetailModel.zxUserDetails.weight ? : @"--";
    return @[@{@"title" : @"星座:",
               @"subTitle" :self.medetailModel.zxUserDetails.constellation?:@""
               },
             @{@"title" : @"血型:",
               @"subTitle" :self.medetailModel.zxUserDetails.bloodType?:@""
               },
             @{@"title" : @"身高体重:",
               @"subTitle" :[NSString stringWithFormat:@"%@cm/%@kg",height,weight]
               },
             @{@"title" : @"户口:",
               @"subTitle" :self.medetailModel.zxUserDetails.registeredAddress?:@""
               },
             @{@"title" : @"现居地:",
               @"subTitle" :self.medetailModel.zxUser.presentAddressStr?:@""
               },];
}
-(NSArray *)getJingliData {
    NSLog(@"%@",self.medetailModel.zxUserDetails.occupation);
            NSString *xueli = @"";
    if ([self.medetailModel.zxUserDetails.education integerValue] == 0) {
        xueli = @"小学";
    } else if ([self.medetailModel.zxUserDetails.education integerValue] == 1) {
         xueli = @"初中";
    } else if ([self.medetailModel.zxUserDetails.education integerValue] == 2) {
        xueli = @"高中";
    } else if ([self.medetailModel.zxUserDetails.education integerValue] == 3) {
        xueli = @"大专";
    } else if ([self.medetailModel.zxUserDetails.education integerValue] == 4) {
        xueli = @"本科";
    } else if ([self.medetailModel.zxUserDetails.education integerValue] == 5) {
        xueli = @"硕士";
    } else {
        xueli = @"博士";
    }
    NSString *gongzuo = @"";
    if ([self.medetailModel.zxUserDetails.workingState integerValue] == 0) {
        gongzuo = @"工作";
    } else if ([self.medetailModel.zxUserDetails.workingState integerValue] == 1) {
        gongzuo = @"学生";
    } else {
        gongzuo = @"待业";
    }
    
    return @[@{@"title" : @"行业:",
               @"subTitle" :self.medetailModel.zxUserDetails.occupation?:@""
               },
             @{@"title" : @"职位:",
               @"subTitle" :self.medetailModel.zxUserDetails.position?:@""
               },
             @{@"title" : @"收入:",
               @"subTitle" :self.medetailModel.zxUserDetails.income?:@""
               },
             @{@"title" : @"毕业院校:",
               @"subTitle" :self.medetailModel.zxUserDetails.school?:@""
               },
             @{@"title" : @"最高学历:",
               @"subTitle" :xueli
               },
             @{@"title" : @"现状:",
               @"subTitle" :gongzuo
               }];
}


-(void)setMedetailModel:(PPMeDetailModel *)medetailModel {
    _medetailModel = medetailModel;
}

@end
