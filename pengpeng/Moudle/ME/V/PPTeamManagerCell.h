//
//  PPTeamManagerCell.h
//  pengpeng
//
//  Created by wang on 2019/3/13.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPTeamModel.h"

NS_ASSUME_NONNULL_BEGIN
//点击踢出
typedef void(^ClickKick)(NSString *memberId,NSString *name);
//点击转让
typedef void(^ClickTransfer)(NSString *memberId,NSString *name);
@interface PPTeamManagerCell : UITableViewCell

/**
 头像
 */
@property (nonatomic,strong) UIImageView *header;


/**
 姓名
 */
@property (nonatomic,strong) UILabel *NameLabel;



/**
 是否单身
 */
@property (nonatomic,strong) UIImageView *marryImg;



/**
 性别
 */
@property (nonatomic,strong) UIImageView *sexImage;



@property (nonatomic,strong) UILabel *ageLabel;

//转让
@property (nonatomic,strong) UIButton *Btntransfer;


/**
 踢出
 */
@property (nonatomic,strong) UIButton *BtnKick;


@property (nonatomic,strong) PPTeamManagerModel *troopmodel;
@property (nonatomic,copy) ClickKick clickkick;
@property (nonatomic,copy) ClickTransfer clicktransfer;
@end

@interface PPTeamManagerMCell : UITableViewCell
@property (nonatomic,strong) PPTeamManagerModel *troopmodel;
@property (nonatomic,strong) UIImageView *header;
@property (nonatomic,strong) UILabel *NameLabel;
@property (nonatomic,strong) UIImageView *marryImg;
@property (nonatomic,strong) UIImageView *sexImage;
@property (nonatomic,strong) UILabel *ageLabel;
@property (nonatomic, strong)UIImageView *identityImageView;
@end

NS_ASSUME_NONNULL_END
