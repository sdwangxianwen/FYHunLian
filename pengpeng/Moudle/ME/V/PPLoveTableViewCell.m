
//
//  PPLoveTableViewCell.m
//  pengpeng
//
//  Created by wang on 2019/3/14.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPLoveTableViewCell.h"

@implementation PPLoveTableViewCell

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
    self.header.layer.cornerRadius = 21;
    self.header.clipsToBounds = YES;
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(17);
        make.centerY.equalTo(self.contentView);
        make.size.mas_offset(CGSizeMake(42,42));
    }];
    
    self.NameLabel = [[UILabel alloc]init];
    self.NameLabel.textColor = [UIColor colorWithHex:0x3E3E3E];
    self.NameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.NameLabel];
    [self.NameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.header.mas_right).offset(13);
        make.centerY.equalTo(self.contentView);
    }];
    
    self.sexImage = [[UIImageView alloc]init];
    [self.contentView addSubview:self.sexImage];
    [self.sexImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.NameLabel.mas_right).offset(13);
        make.centerY.equalTo(self.contentView);
    }];
    
    self.ageLabel = [[UILabel alloc]init];
    self.ageLabel.textColor = [UIColor colorWithHex:0xa2a2a2];
    self.ageLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.ageLabel];
    [self.ageLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sexImage.mas_right).offset(13);
        make.centerY.equalTo(self.sexImage.mas_centerY);
    }];
    
    self.identityImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.identityImageView];
    [self.identityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(24, 21));
    }];
    
    self.addressLabel = [[UILabel alloc]init];
    self.addressLabel.textColor = [UIColor colorWithHex:0x6e6e6e];
    self.addressLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.addressLabel];
    [self.addressLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.identityImageView.mas_left).offset(-26);
        make.centerY.equalTo(self.sexImage.mas_centerY);
    }];
}

-(void)setListModel:(PPLoveListModel *)listModel {
    _listModel = listModel;
    self.NameLabel.text = listModel.userName;
    [self.header sd_setImageWithURL:[NSURL URLWithString:listModel.headImg] placeholderImage:[UIImage imageNamed:@"graylogo"]];
    if ([listModel.sex isEqualToString:@"0"]) {
        self.sexImage.image = [UIImage imageNamed:@"woman"];
    }
    if ([listModel.sex isEqualToString:@"1"]) {
        self.sexImage.image = [UIImage imageNamed:@"man"];
    }
    self.ageLabel.text = [NSString stringWithFormat:@"%@岁",[PPTools calculateAge:listModel.birthday]];
    self.addressLabel.text = [PPUser showHomeAddress:listModel.presentAddressStr];
}

@end
