//
//  PPMeDetailTableViewCell.m
//  pengpeng
//
//  Created by wang on 2019/3/8.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPMeDetailTableViewCell.h"

//MARK:第0组
@interface PPMeDetailTableViewCell ()
/**
 姓名
 */
@property (nonatomic, strong)UILabel *nameLabel;
/**
 年龄
 */
@property (nonatomic, strong)UILabel *ageLabel;
/**
 性别
 */
@property (nonatomic, strong)UIImageView *sexImageview;
/**
 择偶宣言
 */
@property (nonatomic, strong)UILabel *desLabel;
@end

@implementation PPMeDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
 
    }
    return self;
}
-(UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
        _nameLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        _nameLabel.font = [UIFont systemFontOfSize:20];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(12*kHeight);
            make.left.offset(16*kWidth);
        }];
    }
    return _nameLabel;
}

-(UILabel *)ageLabel {
    if (!_ageLabel) {
        _ageLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_ageLabel];
        _ageLabel.textColor = [UIColor colorWithHex:0x6e6e6e];
        _ageLabel.font = [UIFont systemFontOfSize:18];
        [_ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLabel);
            make.left.equalTo(self.nameLabel.mas_right).offset(16*kWidth);
        }];
    }
    return _ageLabel;
}

-(UILabel *)desLabel {
    if (!_desLabel) {
        _desLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_desLabel];
        _desLabel.numberOfLines = 0;
        _desLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        _desLabel.font = [UIFont systemFontOfSize:13];
        [_desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_left);
            make.right.offset(-16*kWidth);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(11*kHeight);
            make.bottom.offset(-15*kHeight);
        }];
    }
    return _desLabel;
}
-(UIImageView *)sexImageview {
    if (!_sexImageview) {
        _sexImageview = [[UIImageView alloc] init];
        [self.contentView addSubview:_sexImageview];
        [self.sexImageview  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageLabel.mas_right).offset(11*kWidth);
            make.top.offset(15*kHeight);
        }];
    }
    return _sexImageview;
}

-(void)setDetailModel:(PPMeDetailModel *)detailModel {
    _detailModel = detailModel;
    self.nameLabel.text = detailModel.zxUser.userName;
    self.ageLabel.text = [NSString stringWithFormat:@"%@岁",[PPTools calculateAge:detailModel.zxUser.birthday]];
    self.desLabel.text = detailModel.zxUserDetails.declaration;
    if ([detailModel.zxUser.sex integerValue] == 0) {
        //男
        self.sexImageview.image = [UIImage imageNamed:@"me_nv"];
    } else if ([detailModel.zxUser.sex integerValue] == 1) {
        //女
        self.sexImageview.image = [UIImage imageNamed:@"me_nv"];
    } else {
        self.sexImageview.image = [UIImage imageNamed:@""];
    }
}

@end

//组头
@implementation PPMeDetailSectionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self icon];
        [self titleLabel];
    }
    return self;
}
-(UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        [self addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(16*kWidth);
            make.centerY.equalTo(self);
        }];
    }
    return _icon;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self.icon.mas_right).offset(10*kWidth);
        }];
    }
    return _titleLabel;
}
-(void)setModel:(PPMeDetailSectionModel *)model {
    _model = model;
    self.icon.image = [UIImage imageNamed:model.iamgeName];
    self.titleLabel.text = model.title;
    
}

@end


//MARK:只有标题和副标题的cee
@implementation PPMeDetailTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self titleLabel];
    }
    return self;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentRight;
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.offset(22*kWidth);
            make.width.mas_equalTo(70*kWidth);
        }];
    }
    return _titleLabel;
}
-(UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        [self addSubview:_subTitleLabel];
        _subTitleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        _subTitleLabel.font = [UIFont systemFontOfSize:14];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self.titleLabel.mas_right).offset(22*kWidth);
        }];
    }
    return _subTitleLabel;
}


-(void)setModel:(PPMeDetailSectionModel *)model {
    _model = model;
    _titleLabel.text = model.title;
    self.subTitleLabel.text = model.subTitle;
}


@end


@implementation PPMeDeatilQasCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.numberOfLines = 0;
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10*kHeight);
            make.left.offset(18*kWidth);
            make.width.mas_equalTo(kScreenw - 36*kWidth);
        }];
    }
    return _titleLabel;
}
-(UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        [self addSubview:_subTitleLabel];
        _subTitleLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
        _subTitleLabel.font = [UIFont systemFontOfSize:13];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(13*kHeight);
            make.left.offset(42*kWidth);
            make.right.offset(-23*kWidth);
            make.bottom.offset(-10*kHeight);
        }];
    }
    return _subTitleLabel;
}
-(void)setQuesModel:(zxQuestionModel *)quesModel {
    _quesModel = quesModel;
    self.titleLabel.text = quesModel.problemStr;
    self.subTitleLabel.text = quesModel.answerStr;
}

@end

@implementation PPMeDeatilTagCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return self;
}

-(XWTagView *)tagView{
    if (_tagView == nil) {
        _tagView = [[XWTagView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.tagView];
        _tagView.userInteractionEnabled = NO;
    }
    return _tagView;
}


-(void)setHobbyModel:(zxUserHobbyModel *)hobbyModel {
    _hobbyModel = hobbyModel;
    NSArray *arr = [hobbyModel.hobbyJson componentsSeparatedByString:@"#"];
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSString *tag in arr) {
        if (!kStringIsEmpty(tag)) {
            [arrM addObject:tag];
        }
    }
    if (arrM.count > 0) {
        NSMutableAttributedString *attr = [NSMutableAttributedString xw_makeTagView: arrM tagMaker:^(XWTagMaker *make){
            make.strokeColor = [UIColor clearColor];
            make.fillColor = [UIColor colorWithHex:0xF6CE46];
            make.strokeWidth = 1;
            make.cornerRadius = 5;
            make.insets =  UIEdgeInsetsMake(-6, -15, -6, -15);
            make.font = [UIFont systemFontOfSize:11];
            make.textColor = [UIColor colorWithHex:0x3e3e3e];
            make.lineSpace = 10;
            make.space = 10;
            make.maxWidth = kScreenw - 63*kWidth;
            make.tagAlignment = XWTagAlignmentLeft;
        }];
        
        self.tagView.tagAttr = attr;
        [self.tagView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.offset(42*kWidth);
            make.bottom.offset(0*kHeight);
            make.top.offset(0*kHeight);
            make.height.mas_equalTo(attr.tagHeight + 10*kHeight);
            make.right.offset(-21*kWidth);
        }];
    } else {
        NSLog(@"333");
        [self.tagView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.offset(42*kWidth);
            make.bottom.offset(0*kHeight);
            make.top.offset(0*kHeight);
            make.height.mas_equalTo(0);
            make.right.offset(-21*kWidth);
        }];
    }
    
   
}

-(void)setChartModel:(zxUserCharacterModel *)chartModel {
    _chartModel = chartModel;
    NSArray *arr = [chartModel.characterJson componentsSeparatedByString:@"#"];
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSString *tag in arr) {
        if (!kStringIsEmpty(tag)) {
            [arrM addObject:tag];
        }
    }
    NSMutableAttributedString *attr = [NSMutableAttributedString xw_makeTagView: arrM tagMaker:^(XWTagMaker *make){
        make.strokeColor = [UIColor clearColor];
        make.fillColor = [UIColor colorWithHex:0xD86DC8];
        make.strokeWidth = 1;
        make.cornerRadius = 5;
        make.insets =  UIEdgeInsetsMake(-6, -15, -6, -15);
        make.font = [UIFont systemFontOfSize:11];
        make.textColor = [UIColor colorWithHex:0x3e3e3e];
        make.lineSpace = 10;
        make.space = 10;
        make.maxWidth = kScreenw - 63*kWidth;
        make.tagAlignment = XWTagAlignmentLeft;
    }];
    
    self.tagView.tagAttr = attr;
    [self.tagView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.offset(42*kWidth);
        make.bottom.offset(0*kHeight);
        make.top.offset(0*kHeight);
        make.height.mas_equalTo(attr.tagHeight);
        make.right.offset(-21*kWidth);
    }];
}

@end

@implementation PPMeDetailIconCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self arrowImageView];
    }
    return self;
}
-(UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.layer.cornerRadius = 24*kWidth;
        _icon.clipsToBounds = YES;
        [self.contentView addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.offset(47*kWidth);
            make.size.mas_equalTo(CGSizeMake(48*kWidth, 48*kWidth));
        }];
    }
    return _icon;
}
-(UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_arrowImageView];
        _arrowImageView.image = [UIImage imageNamed:@"login_arrow"];
        [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.offset(-18*kWidth);
        }];
    }
    return _arrowImageView;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.numberOfLines = 0;
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.icon.mas_top).offset(5*kHeight);
            make.left.equalTo(self.icon.mas_right).offset(17*kWidth);
        }];
    }
    return _titleLabel;
}
-(UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        [self addSubview:_subTitleLabel];
        _subTitleLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
        _subTitleLabel.font = [UIFont systemFontOfSize:13];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10*kHeight);
            make.left.equalTo(self.titleLabel.mas_left);
        }];
    }
    return _subTitleLabel;
}

-(void)setModel:(PPMeDetailModel *)model {
    _model = model;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model.zxUserMatchmaker.headImg] placeholderImage:[UIImage imageNamed:@""]];
    self.titleLabel.text = model.zxUserMatchmaker.userName;
    self.subTitleLabel.text = model.zxUserMatchmaker.groupsName;
   
}

@end
