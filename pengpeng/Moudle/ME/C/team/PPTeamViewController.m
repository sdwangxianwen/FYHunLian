//
//  PPTeamMainViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/13.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPTeamViewController.h"
#import "PPTeamSubViewController.h"
#import "PPTeamModel.h"
#import "PPMeDetailViewController.h" //个人详情
#import <MLMenuView.h>
#import "PPTeamManagerController.h"



@interface PPTeamViewController ()<JXCategoryViewDelegate,PPTeamSubViewControllerDelegate>
@property (nonatomic, strong) JXCategoryTitleView *myCategoryView;
@property (nonatomic, strong) UIImageView *bgSelectedImageView;
@property (nonatomic, strong) UIImageView *bgUnselectedImageView;
@property (nonatomic, strong)PPTeamHeaderView *headerView;

@end

@implementation PPTeamViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initHeaderView];
    [self netWorking];
     self.titles = @[@"已婚队伍", @"未婚队伍"];
    self.myCategoryView.titles = self.titles;
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorLineWidth = JXCategoryViewAutomaticDimension;
    self.myCategoryView.indicators = @[lineView];
    [self initNav];
}

-(void)initNav {
    UIButton *leftBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view addSubview:leftBtn];
    leftBtn.frame = CGRectMake(0, STATUS_BAR_HEIGHT, 44, 44);
    leftBtn.tag = 3000;
    [leftBtn addTarget:self action:@selector(navBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [leftBtn setImage:[UIImage imageNamed:@"white_back"] forState:(UIControlStateNormal)];
    
    if (self.teamType == PPTeamTypeGroupManager || self.teamType == PPTeamTypeMe) {
        UIButton *rightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.view addSubview:rightBtn];
        rightBtn.frame = CGRectMake(kScreenw - 44, STATUS_BAR_HEIGHT, 44, 44);
        [rightBtn addTarget:self action:@selector(navBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        if (self.teamType == PPTeamTypeGroupManager) {
            rightBtn.tag = 1000; //管理
            [rightBtn setImage:[UIImage imageNamed:@"team_more"] forState:(UIControlStateNormal)];
        } else {
            rightBtn.tag = 2000; //分享
            [rightBtn setImage:[UIImage imageNamed:@"team_share"] forState:(UIControlStateNormal)];
        }
    }
}
-(void)navBtnClick:(UIButton *)sender{
    if (sender.tag == 3000) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    if (sender.tag == 1000) {
        //管理
        [self clickcompanyTroopMenu];
        return;
    }
    //分享
}
#pragma mark ---单击右上角的菜单
-(void)clickcompanyTroopMenu {
    NSArray *titles =@[@"队伍管理",@"队伍分享"];
    NSArray *images = @[@"manager",@"MeTroopShare"];
    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake(kScreenw - 100 - 10, 0, 100, 44 * 4) WithTitles:titles WithImageNames:images WithMenuViewOffsetTop:NavBarHight WithTriangleOffsetLeft:90 triangleColor:[UIColor whiteColor]];
    menuView.separatorOffSet = 10;
    menuView.separatorColor = [UIColor colorWithHex:0xa2a2a2];
    menuView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [menuView setMenuViewBackgroundColor:[UIColor whiteColor]];
    menuView.titleColor = [UIColor colorWithHex:0x3e3e3e];
    menuView.contentLeftOffset = 5;
    menuView.didSelectBlock = ^(NSInteger index) {
        if(index == 0) {
            //队伍管理
            PPTeamManagerController *managerVC = [[PPTeamManagerController alloc] init];
            managerVC.companyId = self.teamId;
            [self.navigationController pushViewController:managerVC animated:YES];
        }else if (index == 1) {
            //队伍分享
        }
    };
    [menuView showMenuEnterAnimation:MLAnimationStyleNone];
}

-(void)initHeaderView {
    _headerView = [[PPTeamHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenw,  TEAM_HEADER_HEIGHT) teamType:self.teamType];
    [self.view insertSubview:_headerView atIndex:0];
}
//MARK:网络请求
-(void)netWorking {
    //MeTroopsInfo_url GroupRanksInfoByGroupId
    NSString *url = @"";
    NSDictionary *dict = @{};
    if (self.teamType == PPTeamTypeGroupManager || self.teamType == PPTeamTypeGroupMember) {
        url = GroupRanksInfoByGroupId;
        dict = @{@"groupId" : self.teamId ?:@""};
    } else {
        url = MeTroopsInfo_url;
        dict = @{@"matchmakerUserId" : self.teamId ?:@""};
    }
    [[PPNetTool share] get:url parm:dict modelClass:[PPTeamModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(PPTeamModel *response) {
        [self.headerView reloadHeaderView:response];
    }];
}

-(NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.categoryView.frame = CGRectMake(0, self.headerView.fy_maxY-44, kScreenw, 44);
    self.listContainerView.frame = CGRectMake(0, self.headerView.fy_maxY, kScreenw, kScreenH - self.headerView.fy_maxY);
}
- (JXCategoryTitleView *)myCategoryView {
    return (JXCategoryTitleView *)self.categoryView;
}

- (JXCategoryBaseView *)preferredCategoryView {
    return [[JXCategoryTitleView alloc] init];
}

- (id<JXCategoryListContentViewDelegate>)preferredListAtIndex:(NSInteger)index {
    PPTeamSubViewController *subVC = [[PPTeamSubViewController alloc] init];
    subVC.delegate = self;
    if (index == 0) {
        subVC.teamType = @"1";
    } else {
         subVC.teamType = @"2";
    }
    subVC.type = self.teamType;
    subVC.teamID = self.teamId;
    return subVC;
}

-(void)seeMemberInfo:(NSString *)userid {
    PPMeDetailViewController *meVC = [[PPMeDetailViewController alloc] init];
    meVC.userId = userid;
    [self.navigationController pushViewController:meVC animated:YES];
}
-(void)scorllHeight:(CGFloat)height {
    self.headerView.frame = CGRectMake(0, height, kScreenw, TEAM_HEADER_HEIGHT);
    self.categoryView.frame = CGRectMake(0, self.headerView.fy_maxY - 44, kScreenw, 44);
    self.listContainerView.frame = CGRectMake(0,self.headerView.fy_maxY, kScreenw, kScreenH - self.headerView.fy_maxY);
}

@end
