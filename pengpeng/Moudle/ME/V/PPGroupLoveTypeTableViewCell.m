//
//  PPGroupLoveTypeTableViewCell.m
//  pengpeng
//
//  Created by wang on 2019/3/11.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPGroupLoveTypeTableViewCell.h"
#import "PPGroupLoveModel.h"

@interface PPGroupLoveTypeTableViewCell ()
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *subTitleLabel;

@end

@implementation PPGroupLoveTypeTableViewCell

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
        [self.contentView addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
            make.height.mas_equalTo(107*kHeight);
        }];
    }
    return _icon;
}
-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(41*kWidth);
            make.top.offset(34*kHeight);
        }];
    }
    return _titleLabel;
}
-(UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_subTitleLabel];
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        _subTitleLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(41*kWidth);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(11*kHeight);
        }];
    }
    return _subTitleLabel;
}

-(void)setModel:(PPGroupLoveModel *)model {
    _model = model;
    self.icon.image = [UIImage imageNamed:model.ImageName];
    self.titleLabel.text = model.title;
    self.subTitleLabel.text = model.subTitle;
}
@end
