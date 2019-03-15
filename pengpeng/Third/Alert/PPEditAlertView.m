//
//  PPEditAlertView.m
//  pengpeng
//
//  Created by wang on 2019/3/11.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPEditAlertView.h"

@interface PPEditAlertView ()<YYTextViewDelegate>
@property (nonatomic, strong)UILabel *titleLabel; //标题
@property (nonatomic, strong)YYTextView *editTextView; //编辑按钮
@property (nonatomic, strong)UIButton *cancaleBtn; //取消按钮
@property (nonatomic, strong)UIButton *sureBtn; //确定按钮
@property (nonatomic, strong)UIView *coverView; //遮盖
@property (nonatomic, strong)UIView *bgView; //共有的
@end

@implementation PPEditAlertView

//MARK:懒加载控件
-(UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_bgView addSubview:_sureBtn];
        [_sureBtn setTitle:@"确定" forState:(UIControlStateNormal)];
        [_sureBtn setTitleColor:[UIColor colorWithHex:0xAB56FD] forState:(UIControlStateNormal)];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sureBtn addTarget:self action:@selector(surebtnClick) forControlEvents:(UIControlEventTouchUpInside)];
        [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-28);
            make.bottom.offset(-15);
        }];
    }
    return _sureBtn;
}

-(UIButton *)cancaleBtn {
    if (!_cancaleBtn) {
        _cancaleBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_bgView addSubview:_cancaleBtn];
        [_sureBtn setTitle:@"确定" forState:(UIControlStateNormal)];
        [_cancaleBtn setTitleColor:[UIColor colorWithHex:0xAB56FD] forState:(UIControlStateNormal)];
        _cancaleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_cancaleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
        [_cancaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.sureBtn.mas_left).offset(-28);
            make.bottom.offset(-15);
        }];
    }
    return _cancaleBtn;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(24, 20, _bgView.width - 48, 30)];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"请输入内容";
        _titleLabel.numberOfLines = 0;
        [_bgView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(33*kHeight);
            make.left.offset(21*kWidth);
            make.right.offset(-28*kWidth);
        }];
    }
    return _titleLabel;
}

-(instancetype)initWithFrame:(CGRect)frame
                       title:(NSString *)title
                        type:(PPAlertType)type
                        sure:(NSString *)sure
                      cancle:(NSString *)cancle {
    self = [super initWithFrame:frame];
    if (self) {
        self.type = type;
        self.userInteractionEnabled = YES;
        [self setupUI];
        if (type == PPAlertTypeTwoBtn) {
             [self.sureBtn setTitle:sure forState:(UIControlStateNormal)];
             [self.cancaleBtn setTitle:cancle forState:(UIControlStateNormal)];
        }
        if (type == PPAlertTypeOneBtn) {
            [self.sureBtn setTitle:sure forState:(UIControlStateNormal)];
        }
       
        self.titleLabel.text = title;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title type:(PPAlertType)type {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.type = type;
        self.userInteractionEnabled = YES;
        [self setupUI];
        self.titleLabel.text = title;
    }
    return self;
}
-(void)coverViewClick{
    [PPEditAlertView disMiss];
}
-(void)setupUI {
    _coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _coverView.backgroundColor = [UIColor blackColor];
    _coverView.alpha = 0.3;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverViewClick)];
    [_coverView addGestureRecognizer:tap];
    [self addSubview:_coverView];
    CGFloat height = 0;
    if (self.type == PPAlertTypeInput) {
        height = 189*kHeight;
    } else {
        height = 142*kHeight;
    }
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(28*kWidth, 253*kHeight, kScreenw - 56*kWidth, height)];
    _bgView.backgroundColor = [UIColor whiteColor];
    _bgView.layer.cornerRadius = 5;
    _bgView.clipsToBounds = YES;
    [self addSubview:_bgView];
    
    if (self.type == PPAlertTypeInput) {
        _editTextView = [[YYTextView  alloc] initWithFrame:CGRectMake(39, self.titleLabel.fy_maxY + 20, self.bgView.width - 39 - 28, 30)];
        _editTextView.placeholderText = @"点击输入";
        _editTextView.textColor = [UIColor colorWithHex:0x3e3e3e];
        _editTextView.font = [UIFont systemFontOfSize:14];
        _editTextView.delegate = self;
        [_bgView addSubview:_editTextView];
        
        UIView *line = [[UIView alloc] init];
        [_bgView addSubview:line];
        _bgView.userInteractionEnabled = YES;
        line.backgroundColor = [UIColor colorWithHex:0xa2a2a2];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.editTextView.mas_bottom);
            make.left.equalTo(self.editTextView);
            make.width.mas_equalTo(self.editTextView.width);
            make.height.mas_equalTo(1);
        }];
    }
    if (self.type == PPAlertTypeOneBtn) {
        [self sureBtn];
    }
    if (self.type == PPAlertTypeTwoBtn) {
        [self sureBtn];
        [self cancaleBtn];
    }
    [self titleLabel];
}



- (CGFloat) heightForString:(NSString *)value fontSize:(CGFloat)fontSize andWidth:(CGFloat)width {
    UITextView *detailTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    detailTextView.font = [UIFont systemFontOfSize:fontSize];
    detailTextView.text = value;
    CGSize deSize = [detailTextView sizeThatFits:CGSizeMake(width,CGFLOAT_MAX)];
    return deSize.height;
}


- (void)textViewDidChange:(YYTextView *)textView {
    CGFloat height = [self heightForString:textView.text fontSize:14 andWidth:textView.width];
    NSLog(@"%f",height);
    textView.frame = CGRectMake(39, self.titleLabel.fy_maxY + 20, self.bgView.width - 39 - 28,MIN(484*kHeight, height));
    if (height > 67) {
        self.bgView.frame = CGRectMake(28*kWidth, MAX(20, 253*kHeight - (height - 67)/2) , kScreenw - 56*kWidth, MIN(kScreenH - 40, 189*kHeight + (height - 67)));
    }
   
}
-(void)surebtnClick {
    if (self.type == PPAlertTypeInput) {
        if (self.editTextView.text.length > 0) {
            if (self.editBlock) {
                self.editBlock(self.editTextView.text);
            }
           
        }
    }
    if (self.type == PPAlertTypeTwoBtn) {
        if (self.sureBlock) {
            self.sureBlock();
        }
    }
    [PPEditAlertView disMiss];
}
-(void)cancleBtnClick {
    if (self.type == PPAlertTypeTwoBtn) {
        if (self.cancleBlock) {
            self.cancleBlock();
        }
    }
    [PPEditAlertView disMiss];
}

+(void)showTitle:(NSString *)title
      sureString:(NSString *)sureString
       sureBlock:(sureBlock)sureBlock
          cancle:(NSString *)cancleString
     cancleBlock:(cancleBlock)cancleBlock {
    PPEditAlertView *alertView = [[PPEditAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds title:title type:PPAlertTypeTwoBtn sure:sureString cancle:cancleString];
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
    [self getView].sureBlock = sureBlock;
    [self getView].cancleBlock = cancleBlock;
}

+(void)show:(NSString *)title type:(PPAlertType)type complete:(editBlock)complete  {
    PPEditAlertView *alertView = [[PPEditAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds title:title type:type];
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
    [self getView].editBlock = complete;
}
+ (PPEditAlertView *)getView {
    NSEnumerator *subviewsEnum = [[UIApplication sharedApplication].keyWindow.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            PPEditAlertView *alertView = (PPEditAlertView *)subview;
            return alertView;
        }
    }
    return nil;
}
+(void)disMiss {
    [[self getView] removeFromSuperview];
}
@end
