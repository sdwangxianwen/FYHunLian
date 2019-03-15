//
//  PPInputInfoViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPInputInfoViewController.h"
#import "PPInputTableViewCell.h"
#import "PPTextView.h"
#import "WSDatePickerView.h" //日期选择
#import "PPCharacterView.h" //性格
#import "PPUserChart.h"
#import "PPChartModel.h"

static NSString *const PPInputTableViewCellID = @"PPInputTableViewCellID";

@interface PPInputInfoViewController ()
@property (nonatomic, strong)NSString *birthday;
@property (nonatomic, strong)NSString *name; //昵称
@property (nonatomic,assign)NSInteger sex; //0男1女

@end

@implementation PPInputInfoViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.leftBtn setTitle:@"身份选择" forState:(UIControlStateNormal)];
    self.leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.mainTableView.rowHeight = 50*kHeight;
    [[PPUserChart share].chartArrM removeAllObjects];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleLabel];
    self.titleLabel.text = @"请填写基本信息";
    [self setupUI];
}
-(void)setupUI {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, 20)];
    headerView.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, kScreenw - 50, 20)];
    label.text = @"用于我们更精准的服务";
    label.font = [UIFont systemFontOfSize:10];
    label.textColor = [UIColor colorWithHex:0x3e3e3e];
    [headerView addSubview:label];
    self.mainTableView.tableHeaderView = headerView;
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, 88*kHeight)];
    footerView.backgroundColor = [UIColor whiteColor];
    UIButton *nextBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    nextBtn.frame = CGRectMake(220*kWidth, 47, 125*kWidth, 50*kHeight);
    [nextBtn setImage:[UIImage imageNamed:@"input_next"] forState:(UIControlStateNormal)];
    [footerView addSubview:nextBtn];
    [nextBtn addTarget:self action:@selector(netBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    self.mainTableView.tableFooterView = footerView;
}
//MARK:下一步的点击事件
-(void)netBtnClick:(UIButton *)sender {
    if (!self.name) {
        [SVProgressHUD showErrorWithStatus:@"请填写姓名"];
        return;
    }
    if (!self.birthday) {
        [SVProgressHUD showErrorWithStatus:@"请选择生日"];
        return;
    }
    if (self.sex != 0 && self.sex != 1) {
        [SVProgressHUD showErrorWithStatus:@"请选择性别"];
        return;
    }
    if ([PPUserChart share].chartArrM.count <= 0) {
        [SVProgressHUD showErrorWithStatus:@"请选择性格"];
        return;
    }
    NSMutableString *chartString = [NSMutableString string];
    for (PPChartModel *model in [PPUserChart share].chartArrM) {
        NSString *info = [NSString stringWithFormat:@"%@#",model.info];
        [chartString appendString:info];
    }
    NSDictionary *parm = @{@"sex" : @(self.sex),
                           @"birthday" :self.birthday,
                           @"userName" : self.name,
                           @"characterJson" : chartString,
                           @"isMatchmaker" : self.isMatchmaker
                           };
    [[PPNetTool share] post:updateUserEntryInfo_url parm:parm modelClass:[PPBaseModel class] isCache:NO isShowLoadHUD:YES isShowErrorHUD:YES success:^(id response) {
        [SVProgressHUD showSuccessWithStatus:@"填写信息成功"];
        [PPUser saveInputInfo];
        if ([self.isMatchmaker isEqualToString:@"1"]){
            //如果是单身跳转首页
            [UIApplication sharedApplication].keyWindow.rootViewController = [[PPTabBarController alloc] init];
        } else {
            //如果是已婚，跳转到我的队伍
        }
        
    }];
}
-(void)dateSelect:(PPInputTableViewCell *)cell {
    WSDatePickerView *datePickView = [[WSDatePickerView alloc] initWithDateStyle:(DateStyleShowYearMonthDay) CompleteBlock:^(NSDate *selectdate) {
        NSString *date = [selectdate stringWithFormat:@"yyyy-MM-dd"];
        self.birthday = date;
        cell.inputView.text = self.birthday;
    }];
    datePickView.doneButtonColor = [UIColor whiteColor];//确定按钮的颜色
    datePickView.dateLabelColor = [UIColor colorWithHex:0x3e3e3e];
    datePickView.maxLimitDate = [NSDate date];
    [datePickView show];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PPInputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PPInputTableViewCellID forIndexPath:indexPath];
    cell.indexRow = [NSString stringWithFormat:@"%ld",indexPath.row];
    @weakify(self);
    if (indexPath.row == 0) {
        //昵称
        cell.nameBlock = ^(NSString * _Nonnull name) {
            NSLog(@"%@",name);
            weak_self.name = name;
        };
    }
    if (indexPath.row == 2) {
        cell.sexBlock = ^(NSInteger sex) {
            weak_self.sex = sex;
        };
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PPInputTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 1) {
        //出生日期
        [self dateSelect:cell];
        
    }
    if (indexPath.row == 3) {
//        //我的性格
//        [PPCharacterView showWith:@"1" completion:^{
//            [cell showTag];
//        }];
        
        
        [tableView reloadData];
    }
}


//-(UITableView *)mainTableView {
//    if (!_mainTableView) {
//        _mainTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), kScreenw, kScreenH -  CGRectGetMaxY(self.titleLabel.frame)) style:(UITableViewStylePlain)];
//        [self.view addSubview:_mainTableView];
//        _mainTableView.delegate = self;
//        _mainTableView.dataSource = self;
//        [_mainTableView registerClass:[PPInputTableViewCell class] forCellReuseIdentifier:PPInputTableViewCellID];
//        _mainTableView.rowHeight = 50*kHeight;
//        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    }
//    return _mainTableView;
//}

@end
