//
//  PPTeamHeaderView.m
//  pengpeng
//
//  Created by wang on 2019/3/13.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPTeamHeaderView.h"
#import "PPTeamModel.h"

@implementation PPTeamHeaderView

- (instancetype)initWithFrame:(CGRect)frame teamType:(PPTeamType)type {
    self = [super initWithFrame:frame];
    if (self) {
        self.teamType = type;
        [self icon];
        [self setupUI];
    }
    return self;
}
-(void)reloadHeaderView:(PPTeamModel *)teamModel {
    _nameLabel.text = self.teamType == (PPTeamTypeGroupManager | PPTeamTypeGroupMember) ? teamModel.name :teamModel.userName;
    
    if (self.teamType == (PPTeamTypeGroupManager | PPTeamTypeGroupMember)) {
        //企业
        [_headerImageView sd_setImageWithURL:[NSURL URLWithString:teamModel.logo] placeholderImage:[UIImage imageNamed:@"graylogo"]];
        [_bigHeaderImageView sd_setImageWithURL:[NSURL URLWithString:teamModel.logo] placeholderImage:[UIImage imageNamed:@"graylogo"]];
    } else {
        //个人
        [_headerImageView sd_setImageWithURL:[NSURL URLWithString:teamModel.headImg] placeholderImage:[UIImage imageNamed:@"graylogo"]];
        [_bigHeaderImageView sd_setImageWithURL:[NSURL URLWithString:teamModel.headImg] placeholderImage:[UIImage imageNamed:@"graylogo"]];
    }
    
    _marrigeImageView.hidden = teamModel.isMatchmaker != 3;
    _memberCount.text = [NSString stringWithFormat:@"红娘队伍总人数：%ld",(long)teamModel.ranksSize];
    if (teamModel.inRanks == 0) {
       //与红娘的关系 0不在可以申请 1申请中 2在队伍,分型 3自己看自己不存在
        [_statusBtn setImage:[UIImage imageNamed:@"teamstatus_add"] forState:(UIControlStateNormal)];
    }
    if (teamModel.inRanks == 1) {
        [_statusBtn setImage:[UIImage imageNamed:@"teamstatus_adding"] forState:(UIControlStateNormal)];
    }
    if (teamModel.inRanks == 2) {
        [_statusBtn setImage:[UIImage imageNamed:@"teamstatus_share"] forState:(UIControlStateNormal)];
    }
    
}
-(void)setupUI {
    if (self.teamType == PPTeamTypeGroupManager || self.teamType == PPTeamTypeMe) {
        //管理员和我自己的队伍的时候头像显示在中间
        [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.offset(76*kHeight);
            make.size.mas_equalTo(CGSizeMake(73*kWidth, 73*kWidth));
        }];
        //有邀请好友的按钮
        [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.headerImageView);
            make.right.equalTo(self.headerImageView.mas_left).offset(-47*kWidth);
        }];
        //有聊天的按钮
        [self.chatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.headerImageView);
            make.left.equalTo(self.headerImageView.mas_right).offset(46*kWidth);
        }];
        //昵称显示在中间
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.headerImageView.mas_bottom).offset(23*kHeight);
        }];
        [self.marrigeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel);
            make.left.equalTo(self.nameLabel.mas_right);
        }];
        if (self.teamType == PPTeamTypeGroupManager) {
            [self bigHeaderImageView];
        }
    } else {
        //我看别人的队伍和我是团队成员
        //头像显示在左面
        [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(50*kWidth);
            make.top.offset(NavBarHight);
            make.size.mas_equalTo(CGSizeMake(73*kWidth, 73*kWidth));
        }];
        //昵称显示在头像下面
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.headerImageView);
            make.top.equalTo(self.headerImageView.mas_bottom).offset(26*kHeight);
        }];
        //有队伍人数
        [self.memberCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headerImageView.mas_right).offset(16*kWidth);
            make.top.offset(75*kHeight);
        }];
        //有状态按钮
        [self.statusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headerImageView.mas_right).offset(16*kWidth);
            make.top.equalTo(self.memberCount.mas_bottom).offset(18*kHeight);
            make.size.mas_equalTo(CGSizeMake(98*kWidth, 29*kHeight));
        }];
        if (self.teamType == PPTeamTypeGroupMember) {
            [self bigHeaderImageView];
        }
    }
}


-(UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_icon];
        _icon.image = [UIImage imageNamed:@"team_header"];
    }
    return _icon;
}
-(UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] init];
        [self addSubview:_headerImageView];
        _headerImageView.layer .cornerRadius = 73*kWidth/2;
        _headerImageView.clipsToBounds = YES;
        _headerImageView.image = [UIImage imageNamed:@"graylogo"];
    }
    return _headerImageView;
}
-(UIButton *)addBtn {
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addSubview:_addBtn];
        [_addBtn setImage:[UIImage imageNamed:@"team_add"] forState:(UIControlStateNormal)];
    }
    return _addBtn;
}
-(UIButton *)chatBtn {
    if (!_chatBtn) {
        _chatBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addSubview:_chatBtn];
        [_chatBtn setImage:[UIImage imageNamed:@"team_chat"] forState:(UIControlStateNormal)];
    }
    return _chatBtn;
}
-(UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor colorWithHex:0xffffff];
        _nameLabel.font = [UIFont systemFontOfSize:18];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.text = @"嘭嘭";
        [self addSubview:_nameLabel];
    }
    return _nameLabel;
}

-(UIImageView *)marrigeImageView {
    if (!_marrigeImageView) {
        _marrigeImageView = [[UIImageView alloc] init];
        [self addSubview:_marrigeImageView];
        _marrigeImageView.image = [UIImage imageNamed:@"team_biaoshi"];
        
    }
    return _marrigeImageView;
}

-(UIImageView *)bigHeaderImageView {
    if (!_bigHeaderImageView) {
        _bigHeaderImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _bigHeaderImageView.alpha = 0.3;
        [self addSubview:_bigHeaderImageView];
        _bigHeaderImageView.image = [UIImage imageNamed:@"graylogo"];
    }
    return _headerImageView;
}

-(UILabel *)memberCount {
    if (!_memberCount) {
        _memberCount = [[UILabel alloc] init];
        _memberCount.textColor = [UIColor colorWithHex:0xffffff];
        _memberCount.font = [UIFont systemFontOfSize:16];
        [self addSubview:_memberCount];
    }
    return _memberCount;
}

-(UIButton *)statusBtn {
    if (!_statusBtn) {
        _statusBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addSubview:_statusBtn];
    }
    return _statusBtn;
}

@end
