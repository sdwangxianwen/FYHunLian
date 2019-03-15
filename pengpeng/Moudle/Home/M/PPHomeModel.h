//
//  PPHomeModel.h
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPHomeModel : PPBaseModel
@property (nonatomic,copy)NSString *userId;//用户id
@property (nonatomic,copy)NSString *headImg; //用户头像
@property (nonatomic,copy)NSString *userName; //用户名称
@property (nonatomic,copy)NSString *sex; //用户性别
@property (nonatomic,copy)NSString *birthday; //生日
@property (nonatomic,copy)NSString *showGroupName;//显示的背背书
@property (nonatomic,copy)NSString *declaration; //表白宣言
@property (nonatomic,copy)NSString *schoolName; //学校
@property (nonatomic,copy)NSString *presentAddressStr;//地址
@property (nonatomic,copy)NSString *distance;//地址
@property (nonatomic,copy)NSString *detailsImgNum;//照片数量
@property (nonatomic,copy)NSString *haveDynamic; //动态数量

-(CGFloat)cellHight;

@end

NS_ASSUME_NONNULL_END
