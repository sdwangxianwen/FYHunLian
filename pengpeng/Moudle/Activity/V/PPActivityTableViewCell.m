//
//  PPActivityTableViewCell.m
//  pengpeng
//
//  Created by wang on 2019/3/9.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPActivityTableViewCell.h"

@interface PPActivityTableViewCell ()
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *manLabel;
@property (nonatomic, strong)UILabel *womanLabel;
@property (nonatomic, strong)UILabel *feeLabel;
@property (nonatomic, strong)UIButton *signBtn;

@end

@implementation PPActivityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.layer.cornerRadius = 5;
        _icon.clipsToBounds = YES;
        [self.contentView addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(15*kHeight);
            make.left.offset(15*kWidth);
            make.size.mas_equalTo(CGSizeMake(kScreenw - 30*kWidth, 150*kHeight));
        }];
    }
    return _icon;
}
-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.icon.mas_bottom).offset(7*kHeight);
            make.left.offset(15*kWidth);
            make.right.offset(-70*kWidth);
        }];
    }
    return _titleLabel;
}

-(UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(11*kHeight);
            make.left.offset(15*kWidth);
        }];
    }
    return _timeLabel;
}

-(UILabel *)manLabel {
    if (!_manLabel) {
        _manLabel = [[UILabel alloc] init];
        _manLabel.font = [UIFont systemFontOfSize:13];
        _manLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
        [self.contentView addSubview:_manLabel];
        [_manLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLabel.mas_bottom).offset(11*kHeight);
            make.left.offset(15*kWidth);
            make.bottom.offset(-10*kHeight);
        }];
    }
    return _manLabel;
}

-(UILabel *)womanLabel {
    if (!_womanLabel) {
        _womanLabel = [[UILabel alloc] init];
        _womanLabel.font = [UIFont systemFontOfSize:13];
        _womanLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
        [self.contentView addSubview:_womanLabel];
        [_womanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLabel.mas_bottom).offset(11*kHeight);
            make.left.equalTo(self.manLabel.mas_right).offset(14*kWidth);
        }];
    }
    return _womanLabel;
}

-(UILabel *)feeLabel {
    if (!_feeLabel) {
        _feeLabel = [[UILabel alloc] init];
        _feeLabel.font = [UIFont systemFontOfSize:14];
        _feeLabel.textColor = [UIColor colorWithHex:0xFE6D6D];
        [self.contentView addSubview:_feeLabel];
        [_feeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLabel);
            make.right.offset(-14*kWidth);
        }];
    }
    return _feeLabel;
}
-(UIButton *)signBtn {
    if (!_signBtn) {
        _signBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:_signBtn];
        [_signBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-15*kWidth);
            make.centerY.equalTo(self.manLabel);
        }];
    }
    return _signBtn;
}

-(void)setModel:(PPActivityListModel *)model {
    _model = model;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model.activityPoster] placeholderImage:[UIImage imageNamed:@""]];
    self.titleLabel.text = model.activityTheme;
    self.timeLabel.text = [NSString stringWithFormat:@"%@-%@",[PPTools calculateTimeWtih:model.startTime],[PPTools calculateTimeWtih:model.endTime]];
    self.manLabel.text = [NSString stringWithFormat:@"男：%@/%@",model.manEnterNumber,model.totalManNumber];
    self.womanLabel.text = [NSString stringWithFormat:@"女：%@/%@",model.womenEnterNumber,model.totalWomenNumber];
    if ([model.feeType isEqualToString:@"1"]) {
        self.feeLabel.text = @"收费";
    } else {
        self.feeLabel.text = @"免费";
    }
    //已报名
    if ([model.activityState isEqualToString:@"0"]) {
        [self.signBtn setImage:[UIImage imageNamed:@"activity_baoming"] forState:UIControlStateNormal];
        
    }else if ([model.activityState isEqualToString:@"1"]) {
        [self.signBtn setImage:[UIImage imageNamed:@"activity_sign"] forState:UIControlStateNormal];
        
    }else if ([model.activityState isEqualToString:@"2"]) {
        [self.signBtn setImage:[UIImage imageNamed:@"activity_jiesu"] forState:UIControlStateNormal];
    }
}


@end
