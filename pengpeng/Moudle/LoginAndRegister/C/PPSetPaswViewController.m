//
//  PPSetPaswViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPSetPaswViewController.h"
#import "PPSelectRoleViewController.h"
#import "PPTextView.h"
#import "PPUserModel.h"

@interface PPSetPaswViewController ()
@property (nonatomic, strong)PPTextView *pasTextView;
@property (nonatomic, strong)PPTextView *pasTextView1;
@end

@implementation PPSetPaswViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleLabel];
    self.titleLabel.text = @"设置登录密码";
    [self setupUI];
}

-(void)setupUI {
   
    PPTextView *pasTextView = [[PPTextView alloc] initWithFrame:CGRectMake(self.titleLabel.fy_x, self.titleLabel.fy_y + self.titleLabel.height + 20, kScreenw - 32, 50)];
    [self.view addSubview:pasTextView];
    pasTextView.pp_textField.secureTextEntry = YES;
    pasTextView.placeHolder = @"设置登录密码";
    self.pasTextView = pasTextView;
    
    PPTextView *pasTextView1 = [[PPTextView alloc] initWithFrame:CGRectMake(self.titleLabel.fy_x, CGRectGetMaxY(pasTextView.frame) + 15, kScreenw - 32, 50)];
    [self.view addSubview:pasTextView1];
    pasTextView1.pp_textField.secureTextEntry = YES;
    pasTextView1.placeHolder = @"确认登录密码";
    self.pasTextView1 = pasTextView1;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.fy_x, CGRectGetMaxY(pasTextView1.frame)+12,  kScreenw - 32, 20)];
    [self.view addSubview:label];
    label.text = @"密码需要字母+数字格式展示，且在6位以上10位以内";
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor colorWithHex:0xa2a2a2];
    
    UIButton *nextBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view addSubview:nextBtn];
    nextBtn.frame = CGRectMake(37*kWidth, CGRectGetMaxY(label.frame) + 58*kHeight, kScreenw - 74*kWidth, 58);
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"login_next"] forState:(UIControlStateNormal)];
    [nextBtn addTarget:self action:@selector(nextBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];

}
-(void)nextBtnClick:(UIButton *)sender {
    if (![self.pasTextView.pp_textField.text isValidAlphaNumberPassword]) {
        [SVProgressHUD showErrorWithStatus:@"密码需要字母+数字格式展示，且在6位以上10位以内"];
        return;
    }
    if (self.pasTextView.pp_textField.text.length < 6 || self.pasTextView.pp_textField.text.length > 10) {
        [SVProgressHUD showErrorWithStatus:@"密码需要字母+数字格式展示，且在6位以上10位以内"];
        return;
    }
    if (![self.pasTextView.pp_textField.text isEqualToString:self.pasTextView1.pp_textField.text]) {
        [SVProgressHUD showErrorWithStatus:@"输入的密码不一致"];
        return;
    }
    NSDictionary *parm = @{@"type" : @"2",
                           @"pasStr" :self.pasTextView.pp_textField.text,
                           @"accountNumber" : self.account,
                           @"verificationCode" :self.code
                           };
    [[PPNetTool share] post:Login_url parm:parm modelClass:[PPUserModel class] isCache:NO isShowLoadHUD:YES isShowErrorHUD:YES success:^(PPUserModel *response) {
        //设置密码成功
        [PPUser saveUserID:response.userId];
        [PPUser saveRcimToken:response.rongYunToken];
        [PPUser saveUserToken:response.userToken];
        PPSelectRoleViewController *roleVC = [[PPSelectRoleViewController alloc]init];
        [self.navigationController pushViewController:roleVC animated:YES];
    }];
}
@end
