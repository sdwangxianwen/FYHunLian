//
//  PPRegisterView.m
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPRegisterView.h"

@interface PPRegisterView ()
@property (nonatomic, strong)UITextField *accountTextField;
@property (nonatomic, strong)UITextField *codeTextFieid;
@property (nonatomic, strong)UIButton *nextBtn;
@end

@implementation PPRegisterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    
    UITextField *accountTextField = [[UITextField alloc] initWithFrame:CGRectMake(21, 0, kScreenw - 21 - 49, 30)];
    self.accountTextField = accountTextField;
    [accountTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:accountTextField];
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, accountTextField.frame.size.height, accountTextField.frame.size.width, 1);
    layer.backgroundColor = [UIColor colorWithHex:0xa2a2a2].CGColor;
    [accountTextField.layer addSublayer:layer];
    accountTextField.placeholder = @"请输入手机号或邮箱";
    accountTextField.font = [UIFont systemFontOfSize:15];
    
    UITextField *codeTextFieid = [[UITextField alloc] initWithFrame:CGRectMake(21, CGRectGetMaxY(accountTextField.frame) + 15, 158*kWidth, 30)];
    self.codeTextFieid = codeTextFieid;
    [codeTextFieid addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    codeTextFieid.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:codeTextFieid];
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(0, codeTextFieid.frame.size.height, codeTextFieid.frame.size.width, 1);
    layer2.backgroundColor = [UIColor colorWithHex:0xa2a2a2].CGColor;
    [codeTextFieid.layer addSublayer:layer2];
    codeTextFieid.placeholder = @"请输入验证码";
    codeTextFieid.font = [UIFont systemFontOfSize:15];
    
    JMBaseButtonConfig *baseConfig = [JMBaseButtonConfig buttonConfig];
    baseConfig.title = @"发送验证码";
    baseConfig.titleFont = [UIFont systemFontOfSize:15];
    baseConfig.titleColor = [UIColor blackColor];
    JMBaseButton *codeBtn = [[JMBaseButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(codeTextFieid.frame) + 30, codeTextFieid.fy_y, 100, 30) ButtonConfig:baseConfig];
    [codeBtn addTarget:self action:@selector(getCode:) forControlEvents:(UIControlEventTouchUpInside)];
    CALayer *layer3 = [CALayer layer];
    layer3.frame = CGRectMake(3, codeBtn.frame.size.height - 1, codeBtn.frame.size.width-3, 1);
    layer3.backgroundColor = [UIColor blackColor].CGColor;
    [codeBtn.layer addSublayer:layer3];
    [self addSubview:codeBtn];
    
    UIButton *nextBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.nextBtn = nextBtn;
    [self addSubview:nextBtn];
    nextBtn.frame = CGRectMake(26*kWidth, CGRectGetMaxY(codeBtn.frame) + 209*kHeight, kScreenw - 52*kWidth, 58);
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"login_next"] forState:(UIControlStateNormal)];
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"login_nextDis"] forState:(UIControlStateDisabled)];
    nextBtn.enabled = NO;
    [nextBtn addTarget:self action:@selector(nextBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
}

-(void)nextBtnClick:(UIButton *)sender {
    if (self.submitBlock) {
        self.submitBlock(self.accountTextField.text, self.codeTextFieid.text);
    }
}
-(void)getCode:(JMBaseButton *)sender{
    if (![self.accountTextField.text isValidMobileNumber] && ![self.accountTextField.text isValidEmail]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的邮箱或者电话号码"];
        return;
    }
    if ([self.accountTextField.text isValidMobileNumber]) {
        //如果是电话号码
        NSDictionary *parm = @{@"mobilePhone" : self.accountTextField.text,
                               @"sendType" : @"1"
                               };
        [[PPNetTool share] get:SendPhoneCode_url parm:parm modelClass:[PPBaseModel class] isCache:NO isShowLoadHUD:YES isShowErrorHUD:YES success:^(id response) {
             [SVProgressHUD showSuccessWithStatus:@"验证码发送成功"];
        }];
    } else {
        //是邮箱
        NSDictionary *parm = @{@"mailInfo" : self.accountTextField.text,
                               @"sendType" : @"1"
                               };
        [[PPNetTool share] get:SendMailCode_url parm:parm modelClass:[PPBaseModel class] isCache:NO isShowLoadHUD:YES isShowErrorHUD:YES success:^(id response) {
            [SVProgressHUD showSuccessWithStatus:@"验证码发送成功"];
        }];
    }
    [sender startCountDown:60];
}
-(void)textFieldDidChange:(UITextField *)tf {
    if (([self.accountTextField.text isValidEmail] || [self.accountTextField.text isValidMobileNumber]) && self.codeTextFieid.text.length ==6) {
        self.nextBtn.enabled = YES;
    }else {
        self.nextBtn.enabled = NO;
    }
}
@end
