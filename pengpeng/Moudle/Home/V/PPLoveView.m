//
//  PPLoveView.m
//  pengpeng
//
//  Created by wang on 2019/3/9.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPLoveView.h"

@interface PPLoveView ()

@end

@implementation PPLoveView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupUI];
    }
    return self;
}
-(void)setupUI {
    self.loveBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self addSubview:self.loveBtn];
    [self.loveBtn setImage:[UIImage imageNamed:@"home_love"] forState:(UIControlStateNormal)];
    [self.loveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
    [self.loveBtn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    self.loveBtn.tag = 1000;
    
    self.sendGiftBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self addSubview:self.sendGiftBtn];
    [self.sendGiftBtn setImage:[UIImage imageNamed:@"home_send"] forState:(UIControlStateNormal)];
    [self.sendGiftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self);
    }];
    self.sendGiftBtn.tag = 2000;
    [self.sendGiftBtn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.chatBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self addSubview:self.chatBtn];
    [self.chatBtn setImage:[UIImage imageNamed:@"home_chat"] forState:(UIControlStateNormal)];
    [self.chatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self);
    }];
    self.chatBtn.tag = 3000;
    [self.chatBtn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
}

-(void)btnClick:(UIButton *)sender {
    if (sender.tag == 1000) {
        [self clickLoveBtn];
    }
    if (self.btnClickBlock) {
        self.btnClickBlock(sender.tag);
    }
}
-(void)setLikeUserID:(NSString *)likeUserID {
    _likeUserID = likeUserID;
}
-(void)setLikeStatus:(NSString *)likeStatus {
//    _likeStatus = likeStatus;
    if ([likeStatus integerValue] == 0) {
        //1，互相喜欢2我喜欢他3他喜欢我
        _likeStatus = @"2";
        [self.loveBtn setImage:[UIImage imageNamed:@"home_love"] forState:(UIControlStateNormal)];
    }
    if ([likeStatus integerValue] == 1) {
        //1，互相喜欢2我喜欢他3他喜欢我
        _likeStatus = @"0";
        [self.loveBtn setImage:[UIImage imageNamed:@"me_friend"] forState:(UIControlStateNormal)];
    }
    if ([likeStatus integerValue] == 2) {
        //1，互相喜欢2我喜欢他3他喜欢我
         _likeStatus = @"0";
        [self.loveBtn setImage:[UIImage imageNamed:@"Me_Ilike"] forState:(UIControlStateNormal)];
    }
    if ([likeStatus integerValue] == 3) {
        //1，互相喜欢2我喜欢他3他喜欢我
         _likeStatus = @"1";
        [self.loveBtn setImage:[UIImage imageNamed:@"Me_likeMe"] forState:(UIControlStateNormal)];
    }
}

//MARK:点击了喜欢
-(void)clickLoveBtn {
    NSDictionary *parm = @{@"beUserId" :self.likeUserID,
                           @"likeState" : self.likeStatus
                           };
    [[PPNetTool share] get:UpdateFriend_url parm:parm modelClass:[PPBaseModel class] isCache:NO isShowLoadHUD:YES isShowErrorHUD:YES success:^(id response) {

    }];
}


@end
