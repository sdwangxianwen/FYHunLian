//
//  PPInputTableViewCell.m
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPInputTableViewCell.h"
#import "PPTextView.h"
#import "PPChartModel.h"
#import "PPUserChart.h"


@implementation PPInputTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(PPTextView *)inputView {
    if (!_inputView) {
        _inputView = [[PPTextView alloc] initWithFrame:CGRectMake(28, 0, kScreenw - 70*kWidth, 50*kHeight)];
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
-(YYTextView *)tagView {
    if (!_tagView) {
        _tagView = [[YYTextView alloc] initWithFrame:CGRectMake(20*kWidth, 25*kHeight, kScreenw - 70*kWidth, 20*kHeight)];
         [self.contentView addSubview:_tagView];
        _tagView.userInteractionEnabled = NO;
        _tagView.hidden = YES;
        
    }
    return _tagView;
   
}

-(UIImageView *)arrowImageview {
    if (!_arrowImageview) {
        _arrowImageview = [[UIImageView alloc] init];
        [self.contentView addSubview:_arrowImageview];
        _arrowImageview.image = [UIImage imageNamed:@"login_arrow"];
        [_arrowImageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(-8);
            make.right.equalTo(self.inputView.mas_right).offset(-10);
            make.size.mas_equalTo(CGSizeMake(6, 12));
        }];
    }
    return _arrowImageview;
}

-(UIButton *)womanBtn {
    if (!_womanBtn) {
        _womanBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:_womanBtn];
        _womanBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_womanBtn setTitle:@"女" forState:(UIControlStateNormal)];
        _womanBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [_womanBtn setImage:[UIImage imageNamed:@"woman"] forState:(UIControlStateNormal)];
        [_womanBtn setImage:[UIImage imageNamed:@"womanselect"] forState:(UIControlStateSelected)];
        [_womanBtn setTitleColor:[UIColor colorWithHex:0xa2a2a2] forState:(UIControlStateNormal)];
        _womanBtn.tag = 1;
        [_womanBtn addTarget:self action:@selector(selectSex:) forControlEvents:(UIControlEventTouchUpInside)];
        [_womanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.inputView.mas_right).offset(-5);
            make.bottom.offset(-5);
            make.width.mas_equalTo(50);
        }];
    }
    return _womanBtn;
}
-(UIButton *)manBbtn {
    if (!_manBbtn) {
        _manBbtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:_manBbtn];
        _manBbtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_manBbtn setTitle:@"男" forState:(UIControlStateNormal)];
        [_manBbtn setImage:[UIImage imageNamed:@"man"] forState:(UIControlStateNormal)];
        [_manBbtn setImage:[UIImage imageNamed:@"manSelect"] forState:(UIControlStateSelected)];
        _manBbtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _manBbtn.tag = 0;
        [_manBbtn setTitleColor:[UIColor colorWithHex:0xa2a2a2] forState:(UIControlStateNormal)];
        [_manBbtn addTarget:self action:@selector(selectSex:) forControlEvents:(UIControlEventTouchUpInside)];
        [_manBbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.womanBtn.mas_left).offset(-20);
            make.bottom.offset(-5);
            make.width.mas_equalTo(50);
        }];
    }
    return _manBbtn;
}
//选择男女
-(void)selectSex:(UIButton *)sender {
   
    if (sender.tag == 0) {
        _womanBtn.selected = NO;
        _manBbtn.selected = YES;
    } else {
        _womanBtn.selected = YES;
        _manBbtn.selected = NO;
    }
    if (self.sexBlock) {
        NSLog(@"%ld",(long)sender.tag);
        self.sexBlock(sender.tag);
    }
}
-(void)setIndexRow:(NSString *)indexRow{
    _indexRow = indexRow;
    switch ([indexRow integerValue]) {
        case 0:
            self.arrowImageview.hidden = YES;
            self.manBbtn.hidden = YES;
            self.womanBtn.hidden = YES;
            self.inputView.placeHolder = @"昵称";
            break;
        case 1:
            self.arrowImageview.hidden = NO;
            self.manBbtn.hidden = YES;
            self.womanBtn.hidden = YES;
            self.inputView.placeHolder = @"出生日期";
            self.inputView.userInteractionEnabled = NO;
            break;
        case 2:
            self.arrowImageview.hidden = YES;
            self.manBbtn.hidden = NO;
            self.womanBtn.hidden = NO;
            self.inputView.placeHolder = @"性别";
            self.inputView.userInteractionEnabled = NO;
            break;
        case 3:
            self.arrowImageview.hidden = NO;
            self.manBbtn.hidden = YES;
            self.womanBtn.hidden = YES;
            self.inputView.placeHolder = @"我的性格";
            self.inputView.userInteractionEnabled = NO;
            break;

        default:
            break;
    }
}
-(void)showTag {
    self.tagView.hidden = NO;
    self.inputView.pp_textField.hidden = YES;
    self.inputView.pp_placeLabel.hidden = NO;
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    NSMutableArray *tags = [NSMutableArray array];
    for (PPChartModel *model in [PPUserChart share].chartArrM) {
        [tags addObject:model.info];
    }
    for (NSInteger i = 0; i < tags.count; i++) {
        NSString *tag = tags[i];
        NSMutableAttributedString *tagText = [[NSMutableAttributedString alloc] initWithString:tag];
        //插入空格
        [tagText yy_insertString:@"    " atIndex:0];
        [tagText yy_appendString:@"     "];
        //文字颜色和字体
        tagText.yy_font = [UIFont boldSystemFontOfSize:11];
        tagText.yy_color = [UIColor colorWithHex:0x9D60DC];
        //边框
        YYTextBorder *border = [YYTextBorder new];
        border.strokeWidth = 1;
        border.strokeColor = [UIColor colorWithHex:0xF6C977];
        border.fillColor = [UIColor colorWithHex:0xF6C977];
        border.cornerRadius = 3;
        border.insets = UIEdgeInsetsMake(-2, -5.5, -2, -8);
        [tagText yy_setTextBackgroundBorder:border range:[tagText.string rangeOfString:tag]];
        [text appendAttributedString:tagText];
    }
    self.tagView.attributedText = text;
}

@end
