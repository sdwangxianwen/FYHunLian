//
//  PPTeamHeaderView.h
//  pengpeng
//
//  Created by wang on 2019/3/13.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PPTeamModel;

typedef NS_ENUM(NSInteger,PPTeamType) {
    PPTeamTypeMe,//我自己的个人红娘
    PPTeamTypeOther,//别人的个人红娘
    PPTeamTypeGroupMember,//团体红娘的成员
    PPTeamTypeGroupManager,//团体红年的管理员
};

@interface PPTeamHeaderView : UIView
@property (nonatomic,assign)PPTeamType teamType;
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UIImageView *bigHeaderImageView; //头像的背景图，团体红娘专有
@property (nonatomic, strong)UIImageView *headerImageView; //头像
@property (nonatomic, strong)UILabel *nameLabel; //昵称
@property (nonatomic, strong)UILabel *memberCount; //队伍人数
@property (nonatomic, strong)UIButton * addBtn ; //邀请加入按钮
@property (nonatomic, strong)UIButton *chatBtn; //聊天按钮
@property (nonatomic, strong)UIImageView *marrigeImageView; //已婚红娘专有
@property (nonatomic, strong)UIButton *statusBtn;//状态按钮 分享，申请加入 申请中
@property (nonatomic, strong)UIButton *rightBtn; //右上角按钮

-(instancetype)initWithFrame:(CGRect)frame teamType:(PPTeamType)type;
-(void)reloadHeaderView:(PPTeamModel *)teamModel;
@end

