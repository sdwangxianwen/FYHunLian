//
//  PPHomeTableViewCell.m
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPHomeTableViewCell.h"
#import "PPHomeModel.h"

@interface PPHomeTableViewCell ()
@property (nonatomic, strong)UILabel *nameLabel; //姓名
@property (nonatomic, strong)UIImageView *addressImageView; //地址图标
/**
 地址
 */
@property (nonatomic, strong)UILabel *addressLabel;
/**
 毕业院校
 */
@property (nonatomic, strong)UILabel *schoolLabel;
/**
 择偶宣言
 */
@property (nonatomic, strong)UILabel *desLabel;
/**
 底部的背景框
 */
@property (nonatomic, strong)UIImageView *bgImageView;
@property (nonatomic, strong)UILabel *ageLabel;
@end

@implementation PPHomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_headImageView];
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headImageView.clipsToBounds = YES;
        [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.left.offset(16*kWidth);
            make.width.mas_equalTo(kScreenw - 32*kWidth);
            make.height.mas_equalTo(250*kHeight);
        }];
    }
    return _headImageView;
}

-(UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headImageView.mas_bottom).offset(10);
            make.left.equalTo(self.headImageView).offset(10);
        }];
    }
    return _nameLabel;
}
-(UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.font = [UIFont systemFontOfSize:13];
        _addressLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [self.contentView addSubview:_addressLabel];
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLabel);
            make.right.offset(-16*kWidth);
        }];
    }
    return _addressLabel;
}
-(UIImageView *)addressImageView {
    if (!_addressImageView) {
        _addressImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_addressImageView];
        [_addressImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLabel.mas_centerY);
            make.right.equalTo(self.addressLabel.mas_left).offset(-8);
            make.size.mas_equalTo(CGSizeMake(11, 14));
        }];
    }
    return _addressImageView;
}
-(UILabel *)schoolLabel {
    if (!_schoolLabel) {
        _schoolLabel = [[UILabel alloc] init];
        _schoolLabel.font = [UIFont systemFontOfSize:13];
        _schoolLabel.textColor = [UIColor colorWithHex:0x6e6e6e];
        [self.contentView addSubview:_schoolLabel];
        [self.schoolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_left);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(15*kHeight);
        }];
    }
    return _schoolLabel;
}
-(UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        [self.contentView insertSubview:_bgImageView atIndex:0];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self.contentView);
            make.left.offset(13*kWidth);
            make.top.offset(0);
            make.width.mas_equalTo(kScreenw - 26*kWidth);
            make.bottom.offset(0);
        }];
    }
    return _bgImageView;
}
-(UILabel *)desLabel {
    if (!_desLabel) {
        _desLabel = [[UILabel alloc] init];
        _desLabel.font = [UIFont systemFontOfSize:13];
        _desLabel.textColor = [UIColor colorWithHex:0x6e6e6e];
        [self.contentView addSubview:_desLabel];
        [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.schoolLabel.mas_bottom).offset(9*kHeight);
            make.right.offset(-21*kWidth);
            make.bottom.offset(-15*kHeight);
        }];
    }
    return _desLabel;
}

-(UILabel *)ageLabel {
    if (!_ageLabel) {
        _ageLabel = [[UILabel alloc] init];
        _ageLabel.font = [UIFont systemFontOfSize:12];
        _ageLabel.textColor = [UIColor colorWithHex:0x6e6e6e];
        [self.contentView addSubview:_ageLabel];
        [_ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right).offset(15*kWidth);
            make.centerY.equalTo(self.nameLabel);
        }];
    }
    return _ageLabel;
}


-(void)setHomeModel:(PPHomeModel *)homeModel {
    _homeModel = homeModel;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:homeModel.headImg] placeholderImage:[UIImage imageNamed:@"banner_place"]];
    self.nameLabel.text = homeModel.userName;
    self.ageLabel.text = [NSString stringWithFormat:@"%@岁",[PPTools calculateAge:homeModel.birthday]];
    self.addressLabel.text = [PPUser showHomeAddress:homeModel.presentAddressStr];
    if (homeModel.presentAddressStr) {
        self.addressImageView.image = [UIImage imageNamed:@"home_address"];
    } else {
        self.addressImageView.image = [UIImage imageNamed:@""];
    }
    UIImage *img = [UIImage imageNamed:@"home_bottom"];
    self.bgImageView.image = [img resizableImageWithCapInsets:UIEdgeInsetsMake(img.size.height/2.0, img.size.width/2.0, img.size.height/2.0, img.size.width/2.0) resizingMode:UIImageResizingModeStretch];
    self.schoolLabel.text = [NSString stringWithFormat:@"毕业院校:%@",homeModel.schoolName];
    self.desLabel.text = [NSString stringWithFormat:@"择偶宣言:%@",homeModel.declaration];
    self.schoolLabel.hidden = !homeModel.schoolName;
    self.desLabel.hidden = !homeModel.declaration;
    //毕业院校
    if (homeModel.schoolName) {
        //如果有择偶宣言
        if (!homeModel.declaration) {
            //没有择偶宣言
            [self.schoolLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.nameLabel.mas_left);
                make.top.equalTo(self.nameLabel.mas_bottom).offset(15*kHeight);
                make.bottom.offset(-15*kHeight);
            }];
        }
    } else {
        //没有毕业院校
        if (homeModel.declaration) {
            //如果有择偶宣言
            [self.desLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.nameLabel);
                make.top.equalTo(self.nameLabel.mas_bottom).offset(15*kHeight);
                make.right.offset(-21*kWidth);
                make.bottom.offset(-15*kHeight);
            }];
        } else {
            [self.nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.headImageView.mas_bottom).offset(10);
                make.left.equalTo(self.headImageView).offset(10);
                make.bottom.offset(-15*kHeight);
            }];
        }
    }
    
}
@end
