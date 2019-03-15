//
//  PPMeDetailViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPMeDetailViewController.h"
#import "XWNaviTransition.h"
#import "XWInteractiveTransition.h"
#import "PPMeDetailModel.h"
#import "PPMeDetailTableViewCell.h" //cell
#import "PPLoveView.h"
#import "PPEditMeViewController.h" //编辑我的资料

static NSString *const PPMeDetailTableViewCellID = @"PPMeDetailTableViewCellID";

@interface PPMeDetailViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) XWInteractiveTransition *interactiveTransition;
@property (nonatomic, strong)PPMeDetailModel *detailModel;
@property (nonatomic, strong)NSArray *sectionArr;
@property (nonatomic, strong)NSArray *ziliaoArr;//基本资料
@property (nonatomic, strong)NSArray *jingliArr;//经历
@property (nonatomic, strong)NSArray *lifeArr; //生活
@property (nonatomic, strong)PPLoveView *loveView; //底部的三个按钮



@end

@implementation PPMeDetailViewController

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.loveView) {
        [self.loveView removeFromSuperview];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView.frame = CGRectMake(0, 0, kScreenw, kScreenH);
    self.mainTableView.tableHeaderView = self.headerView;
    //初始化手势过渡的代理
    self.interactiveTransition = [XWInteractiveTransition interactiveTransitionWithTransitionType:XWInteractiveTransitionTypePop GestureDirection:XWInteractiveTransitionGestureDirectionRight];
    //给当前控制器的视图添加手势
    [_interactiveTransition addPanGestureForViewController:self];
     self.sectionArr = [NSArray yy_modelArrayWithClass:[PPMeDetailSectionModel class] json:[PPMeDetailSectionModel getSectionData]];
    [self.mainTableView registerClass:[PPMeDetailTableViewCell class] forCellReuseIdentifier:PPMeDetailTableViewCellID];
    [self.mainTableView registerClass:[PPMeDetailSectionView class] forHeaderFooterViewReuseIdentifier:@"sectionView"];
    self.mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, HOME_INDICATOR_HEIGHT + 82*kHeight)];
    [self netWorking];
    if ([self.userId isEqualToString:[PPUser readUserID]]) {
        [self initRightBtn];
        [self.rightBtn setImage:[UIImage imageNamed:@"me_edit"] forState:(UIControlStateNormal)];
    }
}
-(void)rightBtnClick {
    PPEditMeViewController *editVC = [[PPEditMeViewController alloc] init];
    editVC.detailModel = self.detailModel;
    [self.navigationController pushViewController:editVC animated:YES];
}
//MARK:网络请求
-(void)netWorking {
    NSDictionary *parm = @{@"userId" : self.userId ?: @""};
    [[PPNetTool share] get:MeData_url parm:parm modelClass:[PPMeDetailModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(PPMeDetailModel *response) {
        self.detailModel = response;
        PPMeDetailSectionModel *sectionModel = [[PPMeDetailSectionModel alloc] init];
        sectionModel.medetailModel = response;
        self.jingliArr = [NSArray yy_modelArrayWithClass:[PPMeDetailSectionModel class] json:[sectionModel getJingliData]];
        self.lifeArr = [NSArray yy_modelArrayWithClass:[PPMeDetailSectionModel class] json:[sectionModel getLifeData]];
        self.ziliaoArr = [NSArray yy_modelArrayWithClass:[PPMeDetailSectionModel class] json:[sectionModel getZiliaoData]];
        //是否显示底部的按钮
        if (![self.userId isEqualToString:[PPUser readUserID]]) {
            self.loveView.likeUserID = self.userId;
            self.loveView.likeStatus = self.detailModel.likeState ?: @"0";
        }

        NSMutableArray *arrM = [NSMutableArray array];
        for (zxUserDetailsImgsModel *imageModel in response.zxUserDetailsImgs) {
            [arrM addObject:imageModel.imgUrl];
        }
        self.headerView.imageURLStringsGroup = arrM.copy;
        [self.mainTableView reloadData];
    }];
}
//MARK:tableview代理和数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        //基本资料
        return self.ziliaoArr.count;
    }
    if (section == 5) {
        //经理
        return self.jingliArr.count;
    }
    if (section == 6) {
        //生活
        return self.lifeArr.count;
    }
    if (section == 7) {
        return self.detailModel.zxUserQas.count;
    }
    
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2 || indexPath.section == 5 || indexPath.section == 6) {
        //基本资料
        PPMeDetailTitleCell *cell = [[PPMeDetailTitleCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ziliaocell"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"ziliaocell" forIndexPath:indexPath];;
        }
        if (indexPath.section == 2) {
            cell.model = self.ziliaoArr[indexPath.row];
        }
        if (indexPath.section == 5) {
            cell.model = self.jingliArr[indexPath.row];
        }
        if (indexPath.section == 6) {
            cell.model = self.lifeArr[indexPath.row];
        }
        
        cell.detailModel = self.detailModel;
        return cell;
    }
    if (indexPath.section == 3 || indexPath.section == 4) {
        //爱好
        PPMeDeatilTagCell *cell = [[PPMeDeatilTagCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"aihaocell"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"aihaocell" forIndexPath:indexPath];;
        }
        if (indexPath.section == 3) {
            cell.hobbyModel = self.detailModel.zxUserHobby;
        } else {
            cell.chartModel = self.detailModel.zxUserCharacter;
        }
        
        return cell;
    }
    if (indexPath.section == 1) {
        //我的红娘
        PPMeDetailIconCell *cell = [[PPMeDetailIconCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"iconCell"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"iconCell" forIndexPath:indexPath];
        }
        cell.model = self.detailModel;
        return cell;
    }
    if (indexPath.section == 7) {
        //聊聊爱情
        PPMeDeatilQasCell *cell = [[PPMeDeatilQasCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"wenticell"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"wenticell" forIndexPath:indexPath];;
        }
        cell.quesModel = self.detailModel.zxUserQas[indexPath.row];
        return cell;
    }
    
    PPMeDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PPMeDetailTableViewCellID forIndexPath:indexPath];
    cell.detailModel = self.detailModel;
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }
    PPMeDetailSectionView *sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"sectionView"];
    sectionView.frame = CGRectMake(0, 0, kScreenw, 30*kHeight);
    sectionView.contentView.backgroundColor = [UIColor whiteColor];
    sectionView.model = self.sectionArr[section];
    return sectionView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01;
    }
    return 30*kHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2 || indexPath.section == 5 || indexPath.section == 6) {
        return 30*kHeight;
    }
    if (indexPath.section == 1) {
        return 70*kHeight;
    }
    if (indexPath.section == 3) {
        if (kStringIsEmpty(self.detailModel.zxUserHobby.hobbyJson) ) {
            return 0.01;
        }
    }
    if (indexPath.section == 4) {
        if (kStringIsEmpty(self.detailModel.zxUserCharacter.characterJson) ) {
            return 0.01;
        }
    }
    return UITableViewAutomaticDimension;
}


-(SDCycleScrollView *)headerView {
    if (!_headerView) {
        _headerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenw, 331*kHeight - NavBarHight) delegate:self placeholderImage:[UIImage imageNamed:@"banner_place"]];
        _headerView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    }
    return _headerView;
}
-(PPLoveView *)loveView {
    if (!_loveView) {
        _loveView = [[PPLoveView alloc] initWithFrame:CGRectMake(65*kWidth, 579*kHeight - HOME_INDICATOR_HEIGHT, kScreenw - 130*kWidth, 82*kHeight)];
        [[UIApplication sharedApplication].keyWindow addSubview:_loveView];
        _loveView.btnClickBlock = ^(NSInteger tag) {
            if (tag == 1000) {
                //点击了喜欢
            }
            if (tag == 2000) {
                NSLog(@"送礼物");
            }
            if (tag == 3000) {
                NSLog(@"聊天");
            }
        };
    }
    return _loveView;
}



//MARK:手势
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    //分pop和push两种情况分别返回动画过渡代理相应不同的动画操作
    return [XWNaviTransition transitionWithType:operation == UINavigationControllerOperationPush ? XWNaviOneTransitionTypePush : XWNaviOneTransitionTypePop];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    //手势开始的时候才需要传入手势过渡代理，如果直接点击pop，应该传入空，否者无法通过点击正常pop
    return _interactiveTransition.interation ? _interactiveTransition : nil;
}


@end

