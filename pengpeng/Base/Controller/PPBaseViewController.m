//
//  PPBaseViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPBaseViewController.h"
#import "PPCustomNav.h"


@interface PPBaseViewController ()

@end

@implementation PPBaseViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
    // 判断是否有上级页面，有的话再调用
    if ([self.navigationController.viewControllers indexOfObject:self] > 0) {
        [self setClearBar];
        UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, 44, 44)];
        self.leftBtn = backBtn;
        backBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [backBtn setTitleColor:[UIColor colorWithHex:0x4b4b4b] forState:(UIControlStateNormal)];
        backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -22, 0, 0);
        [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [backBtn setImage:[UIImage imageNamed:@"customBack"] forState:UIControlStateNormal];
        UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        self.navigationItem.leftBarButtonItem = barItem;
    } else {
           [self.navigationController setNavigationBarHidden:YES];
    }
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
-(void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initRightBtn {
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, 44, 44)];
    self.rightBtn = backBtn;
    backBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [backBtn setTitleColor:[UIColor colorWithHex:0x4b4b4b] forState:(UIControlStateNormal)];
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 22, 0, 0);
    [backBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.rightBarButtonItem = barItem;
}
-(void)rightBtnClick {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}
//MARK:显示自定义的NAV

-(void)setClearBar {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil]];
}
-(void)setWhiteBar {
    UIImage *whiteImage = [self imageWithColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBackgroundImage:whiteImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil]];
}

-(UIImage*) imageWithColor:(UIColor*)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, kScreenw, NavBarHight);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}
-(void)initTitleLabel {
    if ([self.navigationController.viewControllers indexOfObject:self] > 0) {
         self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, NavBarHight, kScreenw - 32, 40)];
    } else {
         self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, STATUS_BAR_HEIGHT, kScreenw - 32, 40)];
    }
    self.titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.titleLabel];
    
}
-(UIView *)mainHeaderView {
    if (!_mainHeaderView) {
        if ([self.navigationController.viewControllers indexOfObject:self] == 0) {
             _mainHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, NavBarHight)];
        } else {
             _mainHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, NavBarHight - STATUS_BAR_HEIGHT)];
        }
       
        UILabel *titleLabel = [[UILabel alloc] init];
        self.titleLabel = titleLabel;
        titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        titleLabel.font = [UIFont systemFontOfSize:20 weight:2];
        [_mainHeaderView addSubview:titleLabel];
        if ([self.navigationController.viewControllers indexOfObject:self] == 0) {
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(16*kWidth);
                make.top.offset((NavBarHight)/2);
            }];
        } else {
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(16*kWidth);
                make.centerY.equalTo(self.mainHeaderView);
            }];
        }
       
    }
    return _mainHeaderView;
}

-(UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        if ([self.navigationController.viewControllers indexOfObject:self] > 0) {
            _mainTableView.frame = CGRectMake(0, NavBarHight, kScreenw, kScreenH - NavBarHight);
        } else {
             _mainTableView.frame = CGRectMake(0, 0, kScreenw, kScreenH - TAB_BAR_HEIGHT - HOME_INDICATOR_HEIGHT);
        }
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.estimatedRowHeight = 200;
        _mainTableView.rowHeight = UITableViewAutomaticDimension;
        if (@available(iOS 11.0, *)) {
            _mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        if (self.isRefresh) {
            _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropdownRefresh)];
            _mainTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(pullLoading)];
        }
        [self.view addSubview:_mainTableView];
    }
    return _mainTableView;
}
-(void)dropdownRefresh {
    
}//下拉刷新
-(void)pullLoading {
    
}//上拉加载
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    }
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if ([self.navigationController.viewControllers indexOfObject:self] == 0) {
        if (offsetY > STATUS_BAR_HEIGHT) {
            self.customNav.alpha = MIN(1,1 - (( NavBarHight + STATUS_BAR_HEIGHT - offsetY) / NavBarHight));
        }else {
            self.customNav.alpha = 0;
        }
    } else {
        if (offsetY > STATUS_BAR_HEIGHT) {
            self.navigationItem.title = self.titleLabel.text;
        } else {
            self.navigationItem.title = @"";
        }
    }
}
-(PPCustomNav *)customNav {
    if (!_customNav) {
        _customNav = [[PPCustomNav alloc] initWithFrame:CGRectMake(0, 0, kScreenw, NavBarHight)];
         _customNav.titleLable.text = self.titleLabel.text;
        [self.view addSubview:_customNav];
    }
    return _customNav;
}
//MARK:获取用户权限
-(void)getUserpermissions {
    //UserPermission
    [[PPNetTool share] get:UserPermission parm:[NSDictionary dictionary] modelClass:[PPUserPermissionsModel class] isCache:NO isShowLoadHUD:YES isShowErrorHUD:YES success:^(PPUserPermissionsModel *response) {
        self.permissionsModel = response;
    }];
    
}

@end
