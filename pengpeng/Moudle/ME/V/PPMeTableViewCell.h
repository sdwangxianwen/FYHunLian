//
//  PPMeTableViewCell.h
//  pengpeng
//
//  Created by wang on 2019/3/10.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PPMeModel;
NS_ASSUME_NONNULL_BEGIN

@interface PPMeTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel *subTitleLabel;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *arrowImageView;
@property (nonatomic, strong)UIImageView *redPoint;
@property (nonatomic, strong)PPMeModel *model;
@end

@interface PPMeTableViewZeroCell : UITableViewCell
@property (nonatomic, strong)UIImageView *walletImageView;
@property (nonatomic, strong)UILabel *walletLabel;
@property (nonatomic, strong)UILabel *walletTitleLabel;
@property (nonatomic, strong)UIImageView *headImageview;
@property (nonatomic, strong)UILabel *subTitleLabel;
@property (nonatomic, strong)UIImageView *arrowImageView;
@property (nonatomic, strong)PPMeModel *meModel;
@end

typedef void(^selectLabelBlock)(NSInteger tag);
@interface PPMeTableViewOneCell : UITableViewCell
@property (nonatomic, strong)YYLabel *oneLabel;
@property (nonatomic, strong)YYLabel *twoLabel;
@property (nonatomic, strong)YYLabel *threeLabel;
@property (nonatomic, strong)UILabel *two;
@property (nonatomic, strong)UILabel *three;
@property (nonatomic, strong)PPMeModel *meModel;
@property (nonatomic,copy)selectLabelBlock selectLabelBlock;

@end

@interface PPMeTableViewTwoCell : UITableViewCell
@property (nonatomic, strong)UIImageView *bgimageView;
@property (nonatomic, strong)UILabel *subTitleLabel;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)JMBaseButton *btn;
@property (nonatomic, strong)PPMeModel *meModel;
@end



NS_ASSUME_NONNULL_END
