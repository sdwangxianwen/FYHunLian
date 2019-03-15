//
//  PPForgetPswViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPForgetPswViewController.h"
#import "PPRegisterView.h"
#import "PPUserModel.h"
#import "PPSetPaswViewController.h"

@interface PPForgetPswViewController ()
@property (nonatomic, strong)PPRegisterView *registerView;
@end

@implementation PPForgetPswViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleLabel];
    self.titleLabel.text = @"忘记密码";
    @weakify(self);
    self.registerView.submitBlock = ^(NSString * _Nonnull account, NSString * _Nonnull code) {
        [weak_self registerNetWork:account code:code];
    };
}

//校验验证码是否正确
-(void)registerNetWork:(NSString *)account code:(NSString *)code {
    NSDictionary *parm = @{@"accountNumber" : account,
                           @"verificationCode" : code,
                           @"type" : @"3" //1登录2注册3修改
                           };
    [[PPNetTool share] get:ChecakCode parm:parm modelClass:[PPUserModel class] isCache:NO isShowLoadHUD:YES isShowErrorHUD:YES success:^(PPUserModel *response) {
        [SVProgressHUD showSuccessWithStatus:@"注册成功"];
        //跳转设置密码界面
        PPSetPaswViewController *paswVC = [[PPSetPaswViewController alloc] init];
        paswVC.account = account;
        paswVC.code = code;
        [self.navigationController pushViewController:paswVC animated:YES];
    }];
}

-(PPRegisterView *)registerView {
    if (!_registerView) {
        _registerView = [[PPRegisterView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame) + 30, kScreenw, kScreenH -CGRectGetMaxY(self.titleLabel.frame) - 30)];
        [self.view addSubview:_registerView];
    }
    return _registerView;
}


@end
