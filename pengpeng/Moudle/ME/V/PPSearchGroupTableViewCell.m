//
//  PPSearchGroupTableViewCell.m
//  pengpeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPSearchGroupTableViewCell.h"
#import "PPSearchGroupModel.h"

@interface PPSearchGroupTableViewCell ()
//头像
@property (nonatomic,strong) UIImageView *searchheaderImg;

//公司名
@property (nonatomic,strong) UILabel *companyName;

//管理员
@property (nonatomic,strong) UILabel *managerLabel;

//红娘类型 企业红娘/高校红娘
@property (nonatomic,strong) UIImageView *RedMontherImg;

//人数
@property (nonatomic,strong) UILabel *peopleNum;

@property (nonatomic,strong) UIImageView *right;
@end

@implementation PPSearchGroupTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSearchCompanySubviewscell];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}


-(void)setupSearchCompanySubviewscell
{
    
    //背景图片
    UIImageView *bgImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:bgImageView];
    bgImageView.image = [UIImage imageNamed:@"hezuohongnian"];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    self.searchheaderImg = [[UIImageView alloc]init];
    self.searchheaderImg.layer.masksToBounds = YES;
    self.searchheaderImg.layer.cornerRadius = 19;
    self.searchheaderImg.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.searchheaderImg];
    [self.searchheaderImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(19);
        make.centerY.equalTo(self.contentView);
        make.size.mas_offset(CGSizeMake(38,38));
    }];
    
    self.companyName = [[UILabel alloc]init];
    self.companyName.text =@"北京嘭嘭科技有限公司";
    self.companyName.textColor = [UIColor colorWithHex:0x3e3e3e];
    self.companyName.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.companyName];
    [self.companyName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.searchheaderImg.mas_right).offset(11);
        make.top.equalTo(self.contentView.mas_top).offset(30);
        make.size.mas_offset(CGSizeMake(kScreenw - 68,16));
    }];
    
    self.managerLabel = [[UILabel alloc]init];
    self.managerLabel.text =@"管理员:张波";
    self.managerLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
    self.managerLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.managerLabel];
    [self.managerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.companyName.mas_left);
        make.top.equalTo(self.companyName.mas_bottom).offset(8);
        make.size.mas_offset(CGSizeMake(kScreenw - 68,12));
    }];
    
    self.RedMontherImg = [[UIImageView alloc]init];
    self.RedMontherImg.image = [UIImage imageNamed:@"companyredImage"];
    self.RedMontherImg.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:self.RedMontherImg];
    [self.RedMontherImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.companyName.mas_left);
        make.top.equalTo(self.managerLabel.mas_bottom).offset(16);
        //        make.size.mas_offset(CGSizeMake(49,18));
    }];
    
    UIImageView *peoplenumBg = [[UIImageView alloc]init];
    peoplenumBg.image = [UIImage imageNamed:@"peopleNumBg"];
    peoplenumBg.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:peoplenumBg];
    [peoplenumBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.RedMontherImg.mas_right).offset(10);
        make.top.equalTo(self.RedMontherImg.mas_top);
    }];
    
    
    self.peopleNum = [[UILabel alloc]init];
    self.peopleNum.text = @"5000人";
    self.peopleNum.textColor = [UIColor colorWithHex:0x010101];
    self.peopleNum.font = [UIFont systemFontOfSize:10];
    [peoplenumBg addSubview:self.peopleNum];
    [self.peopleNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(peoplenumBg.mas_centerX);
        make.centerY.equalTo(peoplenumBg.mas_centerY);
    }];
    
    
    self.right= [[UIImageView alloc]init];
    self.right.image = [UIImage imageNamed:@"metop_right"];
    [self.contentView addSubview:self.right];
    [self.right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-28);
        make.top.equalTo(peoplenumBg.mas_top);
    }];
    
    self.btnStatus = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnStatus setTitle:@"申请加入" forState:UIControlStateNormal];
    [self.btnStatus setTitleColor:[UIColor colorWithHex:0xa2a2a2] forState:UIControlStateNormal];
    self.btnStatus.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.btnStatus];
    [self.btnStatus mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right.mas_left).offset(-8);
        make.top.equalTo(peoplenumBg.mas_top);
       
    }];
}

@end

@implementation PPSearchGroupDefaultTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    //背景图片
    UIImageView *bgImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:bgImageView];
    bgImageView.image = [UIImage imageNamed:@"hezuohongnian"];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    //lable
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:titleLabel];
    titleLabel.text = @"如贵 企业/高校/团队 还未创建嘭嘭合作红娘队伍 请点击入口进行快速创建。";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.numberOfLines = 0;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(28);
        make.width.mas_equalTo(kScreenw - 56);
    }];
    
    UILabel *creatLabel = [[UILabel alloc] init];
    [self.contentView addSubview:creatLabel];
    creatLabel.text = @"马上创建";
    creatLabel.font = [UIFont systemFontOfSize:14];
    creatLabel.textColor = [UIColor colorWithHex:0xa76ef6];
    [creatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-33);
        make.top.equalTo(titleLabel.mas_bottom).offset(18);
    }];
}

@end
