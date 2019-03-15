//
//  PPMeTableViewCell.m
//  pengpeng
//
//  Created by wang on 2019/3/10.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPMeTableViewCell.h"
#import "PPMeModel.h"
@implementation PPMeTableViewZeroCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self walletImageView];
        [self arrowImageView];
        [self subTitleLabel];
    }
    return self;
}
-(UIImageView *)walletImageView {
    if (!_walletImageView) {
        _walletImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_walletImageView];
        _walletImageView.image =[UIImage imageNamed:@"me_wallet"];
        [_walletImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(12*kWidth);
            make.top.offset(0);
            make.bottom.offset(0);
            make.size.mas_equalTo(CGSizeMake(148*kWidth, 70*kHeight));
        }];
    }
    return _walletImageView;
}
-(UILabel *)walletLabel {
    if (!_walletLabel) {
        _walletLabel = [[UILabel alloc] init];
        [_walletImageView addSubview:_walletLabel];
        _walletLabel.font = [UIFont systemFontOfSize:17];
        _walletLabel.textColor = [UIColor colorWithHex:0xFEFEFE];
        [_walletLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(14*kWidth);
            make.top.offset(13*kHeight);
        }];
    }
    return _walletLabel;
}
-(UILabel *)walletTitleLabel {
    if (!_walletTitleLabel) {
        _walletTitleLabel = [[UILabel alloc] init];
        [_walletImageView addSubview:_walletTitleLabel];
        _walletTitleLabel.font = [UIFont systemFontOfSize:7];
        _walletTitleLabel.textColor = [UIColor colorWithHex:0xffffff];
        [_walletTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(14*kWidth);
            make.bottom.offset(-18*kHeight);
        }];
    }
    return _walletTitleLabel;
}

-(UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        _arrowImageView.image = [UIImage imageNamed:@"login_arrow"];
        [self.contentView addSubview:_arrowImageView];
        [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-16*kWidth);
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(10*kWidth, 17*kHeight));
        }];
    }
    return _arrowImageView;
}
-(UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_subTitleLabel];
        _subTitleLabel.text = @"个人详情";
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        _subTitleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowImageView.mas_left).offset(-10*kWidth);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return _subTitleLabel;
}

-(UIImageView *)headImageview {
    if (!_headImageview) {
        _headImageview = [[UIImageView alloc] init];
        [self.contentView addSubview:_headImageview];
        _headImageview.layer.cornerRadius = 30*kWidth;
        _headImageview.clipsToBounds = YES;
        [_headImageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.subTitleLabel.mas_left).offset(-10*kWidth);
            make.size.mas_equalTo(CGSizeMake(60*kWidth, 60*kWidth));
        }];
    }
    return _headImageview;
}

-(void)setMeModel:(PPMeModel *)meModel {
    _meModel = meModel;
    self.walletLabel.text = @(meModel.kPMoney).description;
    self.walletTitleLabel.text = @"我的钱包";
    [self.headImageview sd_setImageWithURL:[NSURL URLWithString:meModel.headImg] placeholderImage:[UIImage imageNamed:@""]];
}
@end

@implementation PPMeTableViewOneCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self oneLabel];
        [self threeLabel];
        [self twoLabel];
    }
    return self;
}

-(void)labelCLick:(UITapGestureRecognizer *)tap {
    NSLog(@"%ld",tap.view.tag);
    if (self.selectLabelBlock) {
        self.selectLabelBlock(tap.view.tag);
    }
}

-(YYLabel *)oneLabel {
    if (!_oneLabel) {
        _oneLabel = [[YYLabel alloc] init];
        _oneLabel.tag = 3;
        _oneLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelCLick:)];
        [_oneLabel addGestureRecognizer:tap];
        [self.contentView addSubview:_oneLabel];
        [_oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.top.offset(0);
            make.bottom.offset(0);
            make.size.mas_equalTo(CGSizeMake(kScreenw/3, 30*kHeight));
        }];
    }
    return _oneLabel;
}
-(YYLabel *)twoLabel {
    if (!_twoLabel) {
        _twoLabel = [[YYLabel alloc] init];
        _twoLabel.tag = 2;
        _twoLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelCLick:)];
        [_twoLabel addGestureRecognizer:tap];
        [self.contentView addSubview:_twoLabel];
        [_twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(kScreenw/3);
            make.top.offset(0);
            make.bottom.offset(0);
            make.size.mas_equalTo(CGSizeMake(kScreenw/3, 30*kHeight));
        }];
        UILabel *subLabel = [[UILabel alloc] init];
        self.two = subLabel;
        subLabel.textColor = [UIColor colorWithHex:0xFF0055];
        subLabel.font = [UIFont systemFontOfSize:10];
        [_twoLabel addSubview:subLabel];
        [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.right.offset(-15*kWidth);
        }];
    }
    return _twoLabel;
}

-(YYLabel *)threeLabel {
    if (!_threeLabel) {
        _threeLabel = [[YYLabel alloc] init];
        _threeLabel.tag = 1;
        _threeLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelCLick:)];
        [_threeLabel addGestureRecognizer:tap];
        [self.contentView addSubview:_threeLabel];
        [_threeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(kScreenw/3 *2);
            make.top.offset(0);
            make.bottom.offset(0);
            make.size.mas_equalTo(CGSizeMake(kScreenw/3, 30*kHeight));
        }];
        
        UILabel *subLabel = [[UILabel alloc] init];
        self.three = subLabel;
        subLabel.textColor = [UIColor colorWithHex:0xFF0055];
        subLabel.font = [UIFont systemFontOfSize:10];
        [_threeLabel addSubview:subLabel];
        [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.right.offset(-15*kWidth);
        }];
    }
    return _threeLabel;
}
-(NSMutableAttributedString *)fuwenben:(NSString *)str texStr:(NSString *)textStr {
    NSMutableAttributedString *text= [[NSMutableAttributedString alloc] initWithString:str];
    text.yy_font = [UIFont boldSystemFontOfSize:14.0f];
    text.yy_color = [UIColor colorWithHex:0xa2a2a2];
    text.yy_alignment = NSTextAlignmentCenter;
    NSMutableAttributedString *text1= [[NSMutableAttributedString alloc] initWithString:textStr];
    text1.yy_font = [UIFont boldSystemFontOfSize:14.0f];
    text1.yy_color = [UIColor colorWithHex:0x3e3e3e];
    text1.yy_lineSpacing = 10;
    [text appendAttributedString:text1];
    
    return text;
}
-(void)setMeModel:(PPMeModel *)meModel {
    _meModel = meModel;
    self.oneLabel.attributedText = [self fuwenben:@"我喜欢  " texStr:meModel.ilikeNewSize ?: @"0"];
    self.twoLabel.attributedText = [self fuwenben:@"喜欢我  " texStr:meModel.likeMeAllSize ?: @"0"];
    self.threeLabel.attributedText = [self fuwenben:@"知心人  " texStr:meModel.likeEachAllSize ?: @"0"];
    self.two.text = ![meModel.likeMeNewSize isEqualToString:@"0"] && meModel.likeMeNewSize ?[NSString stringWithFormat:@"+%@",meModel.likeMeNewSize] : @"";
    self.three.text = ![meModel.likeEachNewSize isEqualToString:@"0"] && meModel.likeEachNewSize ? [NSString stringWithFormat:@"+%@",meModel.likeEachNewSize] : @"";
}

@end

@implementation PPMeTableViewTwoCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self bgimageView];
        [self btn];
    }
    return self;
}
-(UIImageView *)bgimageView {
    if (!_bgimageView) {
        _bgimageView = [[UIImageView alloc] init];
        _bgimageView.userInteractionEnabled = YES;
        [self.contentView addSubview:_bgimageView];
        _bgimageView.image = [UIImage imageNamed:@"me_bg"];
        [_bgimageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(15*kWidth);
            make.top.offset(10*kHeight);
            make.bottom.offset(-10*kHeight);
            make.height.mas_equalTo(80*kHeight);
            make.right.offset(-15*kWidth);
        }];
    }
    return _bgimageView;
}
-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_bgimageView addSubview:_titleLabel];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor colorWithHex:0xffffff];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(8*kWidth);
            make.top.offset(8*kHeight);
        }];
    }
    return _titleLabel;
}
-(UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        
        [_bgimageView addSubview:_subTitleLabel];
        _subTitleLabel.numberOfLines = 0;
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        _subTitleLabel.textColor = [UIColor colorWithHex:0xffffff];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.bgimageView.mas_bottom).offset(-8);
            make.left.equalTo(self.titleLabel);
        }];
    }
    return _subTitleLabel;
}
-(JMBaseButton *)btn {
    if (!_btn) {
        JMBaseButtonConfig *config = [JMBaseButtonConfig buttonConfig];
        config.title = @"分享队伍";
        config.titleColor = [UIColor colorWithHex:0xffffff];
        config.titleFont = [UIFont systemFontOfSize:14];
        config.image = [UIImage imageNamed:@"me_share"];
        config.styleType = JMButtonStyleTypeRight;
        config.backgroundColor = [UIColor clearColor];
        
        _btn = [JMBaseButton buttonFrame:CGRectZero ButtonConfig:config];
        [self.bgimageView addSubview:_btn];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bgimageView);
            make.right.offset(-6*kWidth);
        }];
    }
    return _btn;
}
-(void)btnClick {
    NSLog(@"分享队伍");
}
-(void)setMeModel:(PPMeModel *)meModel {
    _meModel = meModel;
    self.titleLabel.text = @"我的队伍";
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat:@"单身队伍：%d\n已婚队伍：%d",(meModel.ranksSize - meModel.marriedSize),meModel.marriedSize]];
    att.yy_lineSpacing = 6*kHeight;
   
    self.subTitleLabel.attributedText = att;
    
}

@end



@implementation PPMeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self arrowImageView];
    }
    return self;
}
-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(16*kWidth);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return _titleLabel;
}
-(UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        _arrowImageView.image = [UIImage imageNamed:@"login_arrow"];
        [self.contentView addSubview:_arrowImageView];
        [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-16*kWidth);
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(10*kWidth, 17*kHeight));
        }];
    }
    return _arrowImageView;
}
-(UIImageView *)redPoint {
    if (!_redPoint) {
        _redPoint = [[UIImageView alloc] init];
        _redPoint.image = [UIImage imageNamed:@"me_redpoint"];
        _redPoint.hidden = YES;
        [self.contentView addSubview:_redPoint];
        [_redPoint mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowImageView.mas_left);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return _redPoint;
}

-(UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_subTitleLabel];
        _subTitleLabel.font = [UIFont systemFontOfSize:10];
        _subTitleLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowImageView.mas_left).offset(-15*kWidth);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return _subTitleLabel;
}




-(void)setModel:(PPMeModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
    self.redPoint.hidden = !model.isIcon;
    self.subTitleLabel.hidden = !model.isSubtitle;
    self.subTitleLabel.text = model.subTitle;
}
@end
