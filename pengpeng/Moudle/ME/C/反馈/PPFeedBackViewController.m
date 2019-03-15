//
//  PPFeedBackViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/14.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPFeedBackViewController.h"

@interface PPFeedBackViewController ()<YYTextViewDelegate>
@property (nonatomic, strong)YYTextView *feedTextView;

@end

@implementation PPFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleLabel];
    self.titleLabel.text = @"反馈";
    [self setupUI];
}

-(void)setupUI {
    YYTextView *feedTextView = [[YYTextView alloc] initWithFrame:CGRectMake(0, self.titleLabel.fy_maxY , kScreenw, 247*kHeight)];
    self.feedTextView = feedTextView;
    feedTextView.placeholderText = @"感谢您的宝贵建议";
    feedTextView.placeholderFont = [UIFont systemFontOfSize:14];
    feedTextView.textColor = [UIColor colorWithHex:0x3e3e3e];
    feedTextView.font = [UIFont systemFontOfSize:14];
    feedTextView.backgroundColor = [UIColor colorWithHex:0xf9f9f9];
    feedTextView.textContainerInset = UIEdgeInsetsMake(13, 19, 13, 19);
    feedTextView.returnKeyType = UIReturnKeyDone;
    feedTextView.delegate = self;
    [self.view addSubview:feedTextView];
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setImage:[UIImage imageNamed:@"feed_submit"] forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(feedBtnSubmit:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:submitBtn];
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(29*kWidth);
        make.top.equalTo(feedTextView.mas_bottom).offset(38*kHeight);
        make.size.mas_offset(CGSizeMake(kScreenw  - 58*kWidth,58*kHeight));
    }];
}
-(void)feedBtnSubmit:(UIButton *)sender {
    if (self.feedTextView.text.length <= 0) {
        return;
    }
    NSString *url = @"";
    NSMutableDictionary *feedbackDic = [[NSMutableDictionary alloc]init];
    if (self.jubao) {
//        url = JuBao_url;
        [feedbackDic setObject:self.feedTextView.text forKey:@"reportInfo"];
        [feedbackDic setObject:self.jubao forKey:@"beUserId"];
        
    } else {
        url = Feedback_url;
        [feedbackDic setObject:self.feedTextView.text forKey:@"info"];
    }
    [[PPNetTool share] get:url parm:feedbackDic modelClass:[PPBaseModel class] isCache:NO isShowLoadHUD:YES isShowErrorHUD:YES success:^(id response) {
        [SVProgressHUD showSuccessWithStatus:@"感谢您的意见!"];
        [self.navigationController popViewControllerAnimated:YES];
    }];
}
-(BOOL)textView:(YYTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
@end
