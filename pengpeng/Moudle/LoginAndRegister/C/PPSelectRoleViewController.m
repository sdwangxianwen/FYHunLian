//
//  PPSelectRoleViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPSelectRoleViewController.h"
#import "PPSelectRoleModel.h"
#import "PPInputInfoViewController.h" //填写信息

static NSString *const PPSelectRoleCellID = @"PPSelectRoleCellid";

@interface PPSelectRoleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSArray *roleArr;
@end

@implementation PPSelectRoleViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleLabel];
    self.titleLabel.text = @"请选择您的身份";
    self.roleArr = [NSArray yy_modelArrayWithClass:[PPSelectRoleModel class] json:[PPSelectRoleModel getRoleInfo]];
    [self mainTableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.roleArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PPSelectRoleCell *cell = [tableView dequeueReusableCellWithIdentifier:PPSelectRoleCellID forIndexPath:indexPath];
    cell.model = self.roleArr[indexPath.section];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130*kHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, 30)];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, 30)];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PPInputInfoViewController *infoVC = [[PPInputInfoViewController alloc] init];
   
    if (indexPath.section == 0) {
        //单身
        infoVC.isMatchmaker = @"1";
    } else {
        //已婚
         infoVC.isMatchmaker = @"3";
    }
     [self.navigationController pushViewController:infoVC animated:YES];
}


@end







@interface PPSelectRoleCell ()
@property (nonatomic, strong)UIImageView *headImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *subTitleLabel;
@property (nonatomic, strong)UIImageView *arrowImageView;
@property (nonatomic, strong)CAGradientLayer *gradientLayer;


@end

@implementation PPSelectRoleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self arrowImageView];
    }
    return self;
}

-(UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_headImageView];
        _headImageView.image = [UIImage imageNamed:@"login_roleSingle"];
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.offset(30);
            make.width.mas_equalTo(CGSizeMake(118*kWidth, 130*kHeight));
        }];
    }
    return _headImageView;
}
-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:19];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.headImageView.mas_right).offset(30);
        }];
    }
    return _titleLabel;
}
-(UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_subTitleLabel];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(18);
        }];
    }
    return _subTitleLabel;
}

-(CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = CGRectMake(30,0,kScreenw - 60,130*kHeight);
        _gradientLayer.type = kCAGradientLayerAxial;
        [self.layer insertSublayer:_gradientLayer atIndex:0];
    }
    return _gradientLayer;
}
-(UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_arrowImageView];
        [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.right.offset(-42*kWidth);
        }];
        _arrowImageView.image = [UIImage imageNamed:@"login_arrow"];
    }
    return _arrowImageView;
   
}


-(void)setModel:(PPSelectRoleModel *)model {
    _model = model;
    if ([model.ID isEqualToString:@"1"]) {
        self.gradientLayer.colors = @[(__bridge id)[UIColor colorWithHex:0xa96ff6].CGColor,(__bridge id)[UIColor colorWithHex:0xEA6294].CGColor];
        self.gradientLayer.locations = @[@(0.5),@(1.0)];
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint   = CGPointMake(0, 1);
        
    } else {
        self.gradientLayer.colors = @[(__bridge id)[UIColor colorWithHex:0xF5C976].CGColor,(__bridge id)[UIColor colorWithHex:0xEEB6492].CGColor];
        self.gradientLayer.locations = @[@(0.5),@(1.0)];
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint   = CGPointMake(0, 1);
    }
    self.headImageView.image = [UIImage imageNamed:model.imageName];
    self.titleLabel.text = model.title;
    self.subTitleLabel.text = model.subTitle;
   
}

@end
