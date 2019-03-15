//
//  PPApplyTableViewCell.m
//  pengpeng
//
//  Created by wang on 2019/3/11.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPApplyTableViewCell.h"
#import "PPTextView.h"
@interface PPApplyTableViewCell ()


@end
@implementation PPApplyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
-(PPTextView *)inputView {
    if (!_inputView) {
        _inputView = [[PPTextView alloc] initWithFrame:CGRectMake(18, 0, kScreenw - 36*kWidth, 50*kHeight)];
        @weakify(self);
        _inputView.textBlock = ^(NSString * _Nonnull text) {
            if (weak_self.nameBlock) {
                weak_self.nameBlock(text);
            }
        };
        [self.contentView addSubview:_inputView];
    }
    return _inputView;
}
@end

@interface PPApplyPhotoTableViewCell ()<TZImagePickerControllerDelegate>
@property (nonatomic, strong)UIImage *logoImage;
@end
@implementation PPApplyPhotoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self titleLabel];
        [self icon];
    }
    return self;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(18*kWidth);
            make.top.offset(30*kHeight);
        }];
    }
    return _titleLabel;
}

-(UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon];
        _icon.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconClick:)];
        [_icon addGestureRecognizer:tap];
        _icon.image = [UIImage imageNamed:@"company_lice"];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(7*kHeight);
            make.left.offset(16*kWidth);
            make.size.mas_equalTo(CGSizeMake(kScreenw - 32*kWidth, 170*kHeight));
            make.bottom.offset(0);
        }];
    }
    return _icon;
}
-(void)iconClick:(UITapGestureRecognizer *)tap {
    if (self.selectBlock) {
        self.selectBlock();
    }
   
}

@end



@implementation PPApplyLogoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self titleLabel];
        [self logo];
    }
    return self;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(18*kWidth);
            make.top.offset(30*kHeight);
        }];
    }
    return _titleLabel;
}

-(UIImageView *)logo {
    if (!_logo) {
        _logo = [[UIImageView alloc] init];
        [self.contentView addSubview:_logo];
        _logo.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconClick:)];
        [_logo addGestureRecognizer:tap];
        [_logo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(7*kHeight);
            make.left.offset(16*kWidth);
            make.size.mas_equalTo(CGSizeMake(170*kWidth, 170*kWidth));
            make.bottom.offset(0);
        }];
    }
    return _logo;
}
-(void)iconClick:(UITapGestureRecognizer *)tap {
    if (self.logoBlock) {
        self.logoBlock();
    }
  
}


@end
