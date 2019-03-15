//
//  PPHomeViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPHomeViewController.h"
#import "PPBannerModel.h"
#import "PPHomeModel.h"
#import "PPHomeTableViewCell.h"
#import "XWNaviTransition.h"
#import "XWInteractiveTransition.h"
#import "PPMeDetailViewController.h"


static NSString *const PPHomeTableViewCellID = @"PPHomeTableViewCellID";
@interface PPHomeViewController ()<SDCycleScrollViewDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong)SDCycleScrollView *bannerView;
@property (nonatomic,assign)NSInteger pageNum;
@property (nonatomic, strong)NSMutableArray *memberArrm;// 推荐列表数量


@end

@implementation PPHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageNum = 1;
    self.memberArrm = [NSMutableArray array];
    self.mainHeaderView.frame = CGRectMake(0, 0, kScreenw, 150*kHeight + NavBarHight);
    self.titleLabel.text = @"嘭嘭";
    [self.mainHeaderView addSubview:self.bannerView];
    self.isRefresh = YES;
    self.mainTableView.tableHeaderView = self.mainHeaderView;
    [self getBannerData];
    [self getHomeData];
}



//MARK:获取轮播图的数据
-(void)getBannerData {
    [[PPNetTool share] get:HomeBanner parm:@{} modelClass:[PPBannerModel class] isCache:YES isShowLoadHUD:NO isShowErrorHUD:NO success:^(NSArray *response) {
        NSMutableArray *arrm = [NSMutableArray array];
        for (PPBannerModel *model in response) {
            [arrm addObject:model.imgUrl];
        }
        self.bannerView.imageURLStringsGroup = arrm.copy;
    }];
}
-(void)getHomeData {
    NSDictionary *parm = @{@"pageNum" : @(self.pageNum)};
    [[PPNetTool share] get:HomeList parm:parm tableView:self.mainTableView modelClass:[PPHomeModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(NSArray * response) {
        if (response.count > 0) {
            [self.memberArrm addObjectsFromArray:response];
        } else {
            self.pageNum --;
            if (self.pageNum < 1) {
                self.pageNum = 1;
            }
        }
        [self.mainTableView reloadData];
        NSLog(@"%ld",self.memberArrm.count);
    }];
}
-(void)dropdownRefresh {
    [self.memberArrm removeAllObjects];
    self.pageNum = 1;
    [self getHomeData];
}
-(void)pullLoading {
    self.pageNum++;
    [self getHomeData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.memberArrm.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"%@%ld",PPHomeTableViewCellID,indexPath.row];
    PPHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[PPHomeTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellid];
    }
    if (self.memberArrm.count > 0) {
         cell.homeModel = self.memberArrm[indexPath.row];
    }
   
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _currentIndexPath = indexPath;
    PPHomeModel *model = self.memberArrm[indexPath.row];
    PPMeDetailViewController *vc = [[PPMeDetailViewController alloc] init];
    //设置导航控制器的代理为推出的控制器，可以达到自定义不同控制器的退出效果的目的
    self.navigationController.delegate = vc;
    vc.userId = model.userId;
    [self.navigationController pushViewController:vc animated:YES];
}

-(SDCycleScrollView *)bannerView {
    if (!_bannerView) {
        _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, NavBarHight, kScreenw, 150*kHeight) delegate:self placeholderImage:[UIImage imageNamed:@"banner_place"]];
    }
    return _bannerView;
}



@end
