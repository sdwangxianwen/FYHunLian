//
//  PPLoginView.m
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPLoginView.h"
#import "PPUserModel.h"
#import "PPRegisterViewController.h"
#import "PPWebViewController.h"
#import "PPForgetPswViewController.h"


@interface PPLoginView () {
    UIImageView *_bgImageView; //背景图
    UIImageView *_borderImageView; //框架
    UIImageView *_logoImageView;//logo
    UILabel *_loginTitleLabel;
    UITextField *_accountTextField; //账号
    UITextField *_pasTextField;//密码
    UIButton *_registerBtn; //注册
    UIButton *_pasBtn; //修改密码
    UIButton *_submitBtn;//确认按钮
    YYLabel *_aggreLabel; //协议
    UILabel *_thirdLabel;//第三方账号登录
    UIButton *_wechatLoginBtn;// 微信登录
}

@end

@implementation PPLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, 325*kHeight)];
    _bgImageView.image = [UIImage imageNamed:@"Login_bg"];
    [self addSubview:_bgImageView];
    
    _logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 73*kWidth, 73*kWidth)];
    _logoImageView.image = [UIImage imageNamed:@"Login_logo"];
    _logoImageView.center = _bgImageView.center;
    [self addSubview:_logoImageView];
    
    _borderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(_logoImageView.frame) - 55*kWidth, kScreenw-30*kWidth,  356*kHeight)];
    _borderImageView.image = [UIImage imageNamed:@"login_juxing"];
    [self insertSubview:_borderImageView belowSubview:_logoImageView];
    
    _loginTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_borderImageView.frame) + 37*kWidth, CGRectGetMaxY(_logoImageView.frame) + 21*kHeight, kScreenw - 64, 20)];
    _loginTitleLabel.text = @"使用手机号或邮箱登陆";
    _loginTitleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
    _loginTitleLabel.font = [UIFont systemFontOfSize:21];
    [self addSubview:_loginTitleLabel];
    
    //MARK:输入账号
    _accountTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(_loginTitleLabel.frame), CGRectGetMaxY(_loginTitleLabel.frame)+30*kHeight, kScreenw -CGRectGetMinX(_loginTitleLabel.frame) , 30*kHeight)];
    _accountTextField.placeholder = @"请输入手机号或邮箱";
    _accountTextField.font = [UIFont systemFontOfSize:15];
    _accountTextField.textColor = [UIColor colorWithHex:0x3e3e3e];
    [self addSubview:_accountTextField];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_loginTitleLabel.frame), CGRectGetMaxY(_accountTextField.frame), kScreenw - 110*kWidth, 1)];
    line.backgroundColor = [UIColor colorWithHex:0xa2a2a2];
    [self addSubview:line];
    
    //MARK:输入密码
    _pasTextField = [[UITextField alloc] initWithFrame:CGRectMake(_accountTextField.fy_x, line.fy_y+30*kHeight, line.width, 30*kHeight)];
    _pasTextField.placeholder = @"请输入密码";
    _pasTextField.font = [UIFont systemFontOfSize:15];
    _pasTextField.textColor = [UIColor colorWithHex:0x3e3e3e];
    [self addSubview:_pasTextField];
    _pasTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    _pasTextField.secureTextEntry = YES;
    
    //MARK:查看密码
    UIButton *seePasBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [seePasBtn setBackgroundImage:[UIImage imageNamed:@"login_see"] forState:(UIControlStateNormal)];
    [seePasBtn setBackgroundImage:[UIImage imageNamed:@"login_hidden"] forState:(UIControlStateSelected)];
    [seePasBtn addTarget:self action:@selector(seePaswBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:seePasBtn];
    [seePasBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->_pasTextField);
        make.right.equalTo(self->_pasTextField.mas_right);
    }];
    
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_loginTitleLabel.frame), CGRectGetMaxY(_pasTextField.frame), kScreenw - 110, 1)];
    line1.backgroundColor = [UIColor colorWithHex:0xa2a2a2];
    [self addSubview:line1];
    
    //MARK:注册
    _registerBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self addSubview:_registerBtn];
    [_registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [_registerBtn setTitle:@"立即注册" forState:(UIControlStateNormal)];
    _registerBtn.frame = CGRectMake(line1.fy_x, line1.fy_y+line1.fy_height + 10, 60, 30);
    _registerBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_registerBtn setTitleColor:[UIColor colorWithHex:0x3e3e3e] forState:(UIControlStateNormal)];
    
    //MARK:忘记密码
    _pasBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self addSubview:_pasBtn];
    [_pasBtn setTitle:@"忘记密码?" forState:(UIControlStateNormal)];
    _pasBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_pasBtn addTarget:self action:@selector(forgetBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [_pasBtn setTitleColor:[UIColor colorWithHex:0x3e3e3e] forState:(UIControlStateNormal)];
    [_pasBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(line1.mas_right);
        make.top.equalTo(line1.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    //MARK:提交按钮
    _submitBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self addSubview:_submitBtn];
    [_submitBtn setBackgroundImage:[UIImage imageNamed:@"login_submit"] forState:(UIControlStateNormal)];
    _submitBtn.frame = CGRectMake(CGRectGetMidX(line1.frame) - 109*kWidth, CGRectGetMaxY(_registerBtn.frame) + 18, 218*kWidth, 54);
    [_submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    //MARK:协议
    _aggreLabel = [[YYLabel alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(_borderImageView.frame), kScreenw - 30, 30)];
    [self addSubview:_aggreLabel];
    NSString *string = @"注册/登陆表示同意嘭嘭用户协议";
    NSString *actionStr = @"嘭嘭用户协议";
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:string];
    attribute.yy_font = [UIFont boldSystemFontOfSize:13];
    attribute.yy_color = [UIColor colorWithHex:0xa2a2a2];
    YYTextDecoration *decoration = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle
                                    width:@(1)
                                    color:[UIColor colorWithHex:0xa2a2a2]];
    [attribute yy_setTextUnderline:decoration range:[string rangeOfString:actionStr]];
    @weakify(self);
    [attribute yy_setTextHighlightRange:[string rangeOfString:actionStr]
                          color:[UIColor colorWithHex:0xa2a2a2]
                backgroundColor:[UIColor clearColor]
                      tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
                          //跳转协议
                          NSLog(@"%@",[[weak_self getCurrentViewController] class]);
                          PPWebViewController *webVC = [[PPWebViewController alloc] init];
                          webVC.url = @"http://info.pploved.com/agreement.html";
                          [[weak_self getCurrentViewController].navigationController pushViewController:webVC animated:YES];
                         
                          
                      }];
    _aggreLabel.attributedText = attribute;

    _thirdLabel = [[UILabel alloc] init];
    [self addSubview:_thirdLabel];
    _thirdLabel.text = @"第三方账号登陆";
    _thirdLabel.font = [UIFont systemFontOfSize:15];
    _thirdLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
    [_thirdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self->_aggreLabel.mas_bottom).offset(40);
    }];
    
    _wechatLoginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self addSubview:_wechatLoginBtn];
    [_wechatLoginBtn setBackgroundImage:[UIImage imageNamed:@"login_wechat"] forState:(UIControlStateNormal)];
    [_wechatLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self->_thirdLabel.mas_bottom).offset(19);
    }];
}
//确认按钮的点击事件
-(void)submitBtnClick {
    if (![_accountTextField.text isValidMobileNumber] && ![_accountTextField.text isValidEmail]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确电话号码或者邮箱"];
        return;
    }
    if (_pasTextField.text.length <= 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    NSDictionary *parm = @{@"accountNumber":_accountTextField.text,
                           @"pasStr":_pasTextField.text,
                           @"type":@"1"
                           };
    NSLog(@"%@",Login_url);
    [[PPNetTool share] post:Login_url parm:parm modelClass:[PPUserModel class] isCache:NO isShowLoadHUD:YES isShowErrorHUD:YES success:^(PPUserModel * response) {
        [PPUser saveUserID:response.userId];
        [PPUser saveRcimToken:response.rongYunToken];
        [PPUser saveUserToken:response.userToken];
        [SVProgressHUD showSuccessWithStatus:@"登录成功"];
        [[UIApplication sharedApplication] delegate].window.rootViewController = [[PPTabBarController alloc] init];
    }];
}
//MARK:查看密码的点击事件
-(void)seePaswBtnClick:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        _pasTextField.secureTextEntry = YES;
    } else {
        sender.selected = YES;
        _pasTextField.secureTextEntry = NO;
    }
}
-(void)registerBtnClick {
    PPRegisterViewController *registerVC = [[PPRegisterViewController alloc] init];
    [[self getCurrentViewController].navigationController pushViewController:registerVC animated:YES];
}
-(void)forgetBtnClick{
    PPForgetPswViewController *forgetVC = [[PPForgetPswViewController alloc] init];
    [[self getCurrentViewController].navigationController pushViewController:forgetVC animated:YES];
}

@end
