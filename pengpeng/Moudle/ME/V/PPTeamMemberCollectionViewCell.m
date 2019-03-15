//
//  PPTeamMemberCollectionViewCell.m
//  pengpeng
//
//  Created by wang on 2019/3/13.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPTeamMemberCollectionViewCell.h"
#import "PPTeamModel.h"

@interface PPTeamMemberCollectionViewCell ()
@property (nonatomic,strong) UIImageView *singleImg;
@property (nonatomic,strong) UIImageView *sexImg;
@property (nonatomic,strong) UILabel *nickname;
@property (nonatomic,strong) UILabel *ageLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@end

@implementation PPTeamMemberCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSingleTroopscellSubvies];
    }
    return self;
}

-(void)setupSingleTroopscellSubvies {
    _singleImg = [UIImageView new];
    [self.contentView addSubview:_singleImg];
    [_singleImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    self.addressLabel =[UILabel new];
    self.addressLabel.text =@"河北";
    self.addressLabel.textColor = [UIColor colorWithHex:0xf1f1f1];
    self.addressLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(7);
        make.right.equalTo(self.contentView.mas_right).offset(-7);
    }];
    
    self.sexImg = [UIImageView new];
    [_singleImg addSubview:self.sexImg];
    [self.sexImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        make.size.mas_offset(CGSizeMake(14,14));
    }];
    
    self.nickname = [UILabel new];
    self.nickname.text = @"nickname";
    self.nickname.textColor = [UIColor whiteColor];
    self.nickname.font = [UIFont systemFontOfSize:13];
    [_singleImg addSubview:self.nickname];
    [self.nickname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sexImg.mas_right).offset(5);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        make.height.equalTo(@20);
    }];
    
    
    self.ageLabel =[UILabel new];
    self.ageLabel.text = @"25";
    self.ageLabel.textColor = [UIColor whiteColor];
    self.ageLabel.font = [UIFont systemFontOfSize:13];
    [_singleImg addSubview:self.ageLabel];
    [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickname.mas_right).offset(5);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
}

-(void)setMemberModel:(PPTeamMemberModel *)memberModel {
    [_singleImg sd_setImageWithURL:[NSURL URLWithString:memberModel.headImg] placeholderImage:[UIImage imageNamed:@"graylogo"]];
    self.addressLabel.text = [PPUser showHomeAddress:memberModel.presentAddressStr];
    if ([memberModel.sex isEqualToString:@"0"]) {
        self.sexImg.image = [UIImage imageNamed:@"woman"];
    }else if ([memberModel.sex isEqualToString:@"1"]) {
        self.sexImg.image = [UIImage imageNamed:@"man"];
    }
    self.nickname.text = memberModel.userName;
    self.ageLabel.text = [NSString stringWithFormat:@"%@岁",[PPTools calculateAge:memberModel.birthday]];
    
}

@end
