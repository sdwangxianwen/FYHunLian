//
//  PPTeamManagerCell.m
//  pengpeng
//
//  Created by wang on 2019/3/13.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPTeamManagerCell.h"

@implementation PPTeamManagerCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupTroopManagercellSubviews];
    }
    return self;
}

-(void)setupTroopManagercellSubviews {
    self.header = [[UIImageView alloc]init];
    [self.contentView addSubview:self.header];
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.top.equalTo(self.contentView.mas_top).offset(7);
        make.size.mas_offset(CGSizeMake(42,42));
    }];
    
    
    self.NameLabel = [[UILabel alloc]init];
    self.NameLabel.textColor = [UIColor colorWithHex:0x3E3E3E];
    self.NameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.NameLabel];
    [self.NameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.header.mas_right).offset(13);
        make.top.equalTo(self.header.mas_top).offset(5);
    }];
    
    self.marryImg = [[UIImageView alloc]init];
    [self.contentView addSubview:self.marryImg];
    [self.marryImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.NameLabel.mas_bottom).offset(5);
        make.left.equalTo(self.header.mas_right).offset(13);
        make.bottom.offset(-8);
        make.size.mas_equalTo(CGSizeMake(50, 19));
    }];
    
    self.sexImage = [[UIImageView alloc]init];
    [self.contentView addSubview:self.sexImage];
    [self.sexImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.NameLabel.mas_right).offset(13);
        make.bottom.equalTo(self.NameLabel.mas_bottom);
    }];
    
    self.ageLabel = [[UILabel alloc]init];
    self.ageLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
    self.ageLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    [self.contentView addSubview:self.ageLabel];
    [self.ageLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sexImage.mas_right).offset(14);
        make.centerY.equalTo(self.sexImage.mas_centerY);
    }];
    
    self.BtnKick = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.BtnKick setImage:[UIImage imageNamed:@"team_ti"] forState:UIControlStateNormal];
    [self.BtnKick addTarget:self action:@selector(ClickKick) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.BtnKick];
    [self.BtnKick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.size.mas_offset(CGSizeMake(24, 24));
    }];
    
    self.Btntransfer = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.Btntransfer setImage:[UIImage imageNamed:@"team_zhuanrang"] forState:UIControlStateNormal];
    [self.Btntransfer addTarget:self action:@selector(ClickTransfer) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.Btntransfer];
    [self.Btntransfer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.BtnKick.mas_left).offset(-14);
        make.size.mas_offset(CGSizeMake(24,24));
    }];
    
}
//点击踢出
-(void)ClickKick {
    if (self.clickkick) {
        self.clickkick(self.troopmodel.ID,self.troopmodel.userName);
    }
}
//点击转让
-(void)ClickTransfer {
    if (self.clicktransfer) {
        self.clicktransfer(self.troopmodel.ID,self.troopmodel.userName);
    }
}
-(void)setTroopmodel:(PPTeamManagerModel *)troopmodel {
    self.NameLabel.text = troopmodel.userName;
    [self.header sd_setImageWithURL:[NSURL URLWithString:troopmodel.headImg] placeholderImage:[UIImage imageNamed:@"graylogo"]];
    self.ageLabel.text = [NSString stringWithFormat:@"%@岁",[PPTools calculateAge:troopmodel.birthday]];
    if ([troopmodel.sex isEqualToString:@"0"]) {
        self.sexImage.image = [UIImage imageNamed:@"woman"];
    } else if ([troopmodel.sex isEqualToString:@"1"]) {
        self.sexImage.image = [UIImage imageNamed:@"man"];
    }
    if([troopmodel.isMatchmaker isEqualToString:@"3"] ){
        self.marryImg.image = [UIImage imageNamed:@"icon_yihun"];
    } else {
        self.marryImg.image = [UIImage imageNamed:@"icon_single"];
    }
}
@end

@implementation PPTeamManagerMCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    self.header = [[UIImageView alloc]init];
    [self.contentView addSubview:self.header];
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.top.equalTo(self.contentView.mas_top).offset(7);
        make.size.mas_offset(CGSizeMake(42,42));
    }];
    
    self.NameLabel = [[UILabel alloc]init];
    self.NameLabel.textColor = [UIColor colorWithHex:0x3E3E3E];
    self.NameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.NameLabel];
    [self.NameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.header.mas_right).offset(13);
        make.top.equalTo(self.header.mas_top).offset(5);
    }];
    
    self.identityImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_manger"]];
    [self.contentView addSubview:self.identityImageView];
    [self.identityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.NameLabel.mas_bottom).offset(5);
        make.left.equalTo(self.header.mas_right).offset(13);
        make.bottom.offset(-8);
        make.size.mas_equalTo(CGSizeMake(50, 19));
    }];
    
    self.marryImg = [[UIImageView alloc]init];
    [self.contentView addSubview:self.marryImg];
    [self.marryImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.NameLabel.mas_bottom).offset(5);
        make.left.equalTo(self.identityImageView.mas_right).offset(13);
        make.bottom.offset(-8);
        make.size.mas_equalTo(CGSizeMake(50, 19));
    }];
    
    self.sexImage = [[UIImageView alloc]init];
    [self.contentView addSubview:self.sexImage];
    [self.sexImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.NameLabel.mas_right).offset(13);
        make.bottom.equalTo(self.NameLabel.mas_bottom);
    }];
    
    self.ageLabel = [[UILabel alloc]init];
    self.ageLabel.textColor = [UIColor colorWithHex:0xA2A2A2];
    self.ageLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    [self.contentView addSubview:self.ageLabel];
    [self.ageLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sexImage.mas_right).offset(14);
        make.centerY.equalTo(self.sexImage.mas_centerY);
    }];
    
}

-(void)setTroopmodel:(PPTeamManagerModel *)troopmodel {
    _troopmodel = troopmodel;
    self.NameLabel.text = troopmodel.userName;
    [self.header sd_setImageWithURL:[NSURL URLWithString:troopmodel.headImg] placeholderImage:[UIImage imageNamed:@"graylogo"]];
    self.ageLabel.text = [NSString stringWithFormat:@"%@岁",[PPTools calculateAge:troopmodel.birthday]];
    if ([troopmodel.sex isEqualToString:@"0"]) {
        //0男 TroopsInfo_female 1女 TroopsInfo_male
        self.sexImage.image = [UIImage imageNamed:@"TroopsInfo_female"];
    } else if ([troopmodel.sex isEqualToString:@"1"]) {
        self.sexImage.image = [UIImage imageNamed:@"TroopsInfo_male"];
    }
    if([troopmodel.isMatchmaker isEqualToString:@"3"] ){
        self.marryImg.image = [UIImage imageNamed:@"icon_yihun"];
    } else {
        self.marryImg.image = [UIImage imageNamed:@"icon_single"];
    }
}


@end
