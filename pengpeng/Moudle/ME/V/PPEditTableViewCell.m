//
//  PPEditTableViewCell.m
//  pengpeng
//
//  Created by wang on 2019/3/10.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPEditTableViewCell.h"
#import "PPEditModel.h"

@implementation PPEditTableViewCell

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
        [self.contentView addSubview:_titleLabel];
        _titleLabel.textAlignment = NSTextAlignmentRight;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.centerY.equalTo(self.contentView);
            make.width.mas_equalTo(80*kWidth);
        }];
    }
    return _titleLabel;
}


-(UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_subTitleLabel];
        _subTitleLabel.numberOfLines = 0;
        _subTitleLabel.font = [UIFont systemFontOfSize:13];
        _subTitleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).offset(10*kWidth);
            make.right.offset(-15*kWidth);
            make.centerY.equalTo(self.contentView);
            
        }];
    }
    return _subTitleLabel;
}
-(void)setModel:(PPEditModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
    self.subTitleLabel.text = model.subTitle;
}
@end

@implementation PPEditPhotoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self zeroImageBtn];
        [self oneImageBtn];
        [self twoImageBtn];
        [self threeImageBtn];
        [self fiveImageBtn];
        [self fourImageBtn];
        
    }
    return self;
}

-(UIButton *)zeroImageBtn {
    if (!_zeroImageBtn) {
        _zeroImageBtn = [[UIButton alloc] init];
        [self.contentView addSubview:_zeroImageBtn];
        [_zeroImageBtn setBackgroundColor:[UIColor colorWithHex:0xF5F5F5]];
        [_zeroImageBtn addTarget:self action:@selector(selectImage:) forControlEvents:(UIControlEventTouchUpInside)];
        [_zeroImageBtn setImage:[UIImage imageNamed:@"edit_head"] forState:(UIControlStateNormal)];
        _zeroImageBtn.tag = 1;
        [_zeroImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.left.offset(3*kWidth);
            make.size.mas_equalTo(CGSizeMake(245*kWidth, 245*kWidth));
        }];
    }
    return _zeroImageBtn;
}
-(UIButton *)oneImageBtn {
    if (!_oneImageBtn) {
        _oneImageBtn = [[UIButton alloc] init];
        [self.contentView addSubview:_oneImageBtn];
        
        [_oneImageBtn setBackgroundColor:[UIColor colorWithHex:0xF5F5F5]];
        [_oneImageBtn addTarget:self action:@selector(selectImage:) forControlEvents:(UIControlEventTouchUpInside)];
        [_oneImageBtn setImage:[UIImage imageNamed:@"edit_plus"] forState:(UIControlStateNormal)];
        [_oneImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.left.equalTo(self.zeroImageBtn.mas_right).offset(3*kWidth);
            make.right.offset(-3*kWidth);
            make.height.mas_equalTo(122*kHeight);
        }];
    }
    return _oneImageBtn;
}
-(UIButton *)twoImageBtn {
    if (!_twoImageBtn) {
        _twoImageBtn = [[UIButton alloc] init];
        [self.contentView addSubview:_twoImageBtn];
        
        [_twoImageBtn setBackgroundColor:[UIColor colorWithHex:0xF5F5F5]];
        [_twoImageBtn addTarget:self action:@selector(selectImage:) forControlEvents:(UIControlEventTouchUpInside)];
        [_twoImageBtn setImage:[UIImage imageNamed:@"edit_plus"] forState:(UIControlStateNormal)];
        [_twoImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.oneImageBtn.mas_bottom).offset(3*kHeight);
            make.left.equalTo(self.zeroImageBtn.mas_right).offset(3*kWidth);
            make.right.offset(-3*kWidth);
            make.bottom.equalTo(self.zeroImageBtn);
        }];
    }
    return _twoImageBtn;
}
-(UIButton *)threeImageBtn {
    if (!_threeImageBtn) {
        _threeImageBtn = [[UIButton alloc] init];
        [self.contentView addSubview:_threeImageBtn];
        
        [_threeImageBtn setBackgroundColor:[UIColor colorWithHex:0xF5F5F5]];
        [_threeImageBtn addTarget:self action:@selector(selectImage:) forControlEvents:(UIControlEventTouchUpInside)];
        [_threeImageBtn setImage:[UIImage imageNamed:@"edit_plus"] forState:(UIControlStateNormal)];
        [_threeImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.zeroImageBtn.mas_bottom).offset(3*kHeight);
            make.left.offset(3*kWidth);
            make.width.mas_equalTo(123*kWidth);
            make.height.mas_equalTo(121*kHeight);
            make.bottom.offset(0);
        }];
    }
    return _threeImageBtn;
}
-(UIButton *)fourImageBtn {
    if (!_fourImageBtn) {
        _fourImageBtn = [[UIButton alloc] init];
        [self.contentView addSubview:_fourImageBtn];
        
        [_fourImageBtn setBackgroundColor:[UIColor colorWithHex:0xF5F5F5]];
        [_fourImageBtn addTarget:self action:@selector(selectImage:) forControlEvents:(UIControlEventTouchUpInside)];
        [_fourImageBtn setImage:[UIImage imageNamed:@"edit_plus"] forState:(UIControlStateNormal)];
        [_fourImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.zeroImageBtn.mas_bottom).offset(3*kHeight);
            make.left.equalTo(self.threeImageBtn.mas_right).offset(3*kWidth);
            make.right.equalTo(self.fiveImageBtn.mas_left).offset(-3*kWidth);
            make.bottom.offset(0);
        }];
    }
    return _fourImageBtn;
}
-(UIButton *)fiveImageBtn {
    if (!_fiveImageBtn) {
        _fiveImageBtn = [[UIButton alloc] init];
        [self.contentView addSubview:_fiveImageBtn];
        
        [_fiveImageBtn setBackgroundColor:[UIColor colorWithHex:0xF5F5F5]];
        [_fiveImageBtn addTarget:self action:@selector(selectImage:) forControlEvents:(UIControlEventTouchUpInside)];
        [_fiveImageBtn setImage:[UIImage imageNamed:@"edit_plus"] forState:(UIControlStateNormal)];
        [_fiveImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.zeroImageBtn.mas_bottom).offset(3*kHeight);
            make.left.equalTo(self.twoImageBtn.mas_left);
            make.right.offset(-3*kWidth);
            make.bottom.offset(0);
        }];
    }
    return _fiveImageBtn;
}

-(void)selectImage:(UIButton *)sender {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        [sender setImage:photos.firstObject forState:(UIControlStateNormal)];
        
        [[PPNetTool share] upLoadImag:UpdatePhoto_url parm:[NSDictionary dictionary] images:photos name:[NSString stringWithFormat:@"%ld",sender.tag] modelClass:[PPBaseModel class] showView:self.oneImageBtn isShowErrorHUD:YES success:^(id response) {
            
        }];
    }];
    [[self getCurrentViewController] presentViewController:imagePickerVc animated:YES completion:nil];
}


@end


@implementation PPEditNameCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self titleLabel];
        [self subTitleLabel];
        [self editImageView];
    }
    return self;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(15*kWidth);
            make.top.offset(15*kHeight);
        }];
    }
    return _titleLabel;
}


-(UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_subTitleLabel];
        _subTitleLabel.text = @"（点击编辑必填项）";
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        _subTitleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10*kHeight);
            make.bottom.offset(-17*kHeight);
        }];
    }
    return _subTitleLabel;
}
-(UIImageView *)editImageView {
    if (!_editImageView) {
        _editImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_editImageView];
        _editImageView.image = [UIImage imageNamed:@"edit"];
        [_editImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView);
            make.right.offset(-15*kWidth);
            make.size.mas_equalTo(CGSizeMake(18*kWidth, 18*kWidth));
        }];
    }
    return _editImageView;
}

@end


@implementation PPEditSectionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self titleLabel];
        [self icon];
        
    }
    return self;
}
-(UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        [self addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).offset(10*kWidth);
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
            make.left.offset(16*kWidth);
        }];
    }
    return _titleLabel;
}
-(void)setModel:(PPEditModel *)model {
    _model = model;
    self.icon.image = [UIImage imageNamed:model.imageName];
    self.titleLabel.text = model.title;
}

@end

#import "PPLoveModel.h"
@implementation ppeditLoveCell

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
        [self.contentView addSubview:_titleLabel];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(15*kWidth);
            make.top.offset(15*kHeight);
        }];
    }
    return _titleLabel;
}


-(UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_subTitleLabel];
        _subTitleLabel.text = @"（点击编辑必填项）";
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        _subTitleLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(40*kWidth);
            make.right.offset(-24*kWidth);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10*kHeight);
            make.bottom.offset(-10*kHeight);
        }];
    }
    return _subTitleLabel;
}
-(void)setModel:(PPLoveModel *)model {
    _model = model;
    self.titleLabel.text = model.problemInfo;
    self.subTitleLabel.text = model.answer;
}
@end
