//
//  PPMeViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPMeViewController.h"
#import "PPMeModel.h"
#import "PPMeTableViewCell.h"
#import "PPMeDetailViewController.h" //个人详情
#import "PPGroupLoveController.h" //合租红娘
#import "PPLoginViewController.h"
#import "PPQcCodeViewController.h"//我的w二维码
#import "PPTeamViewController.h" //队伍信息
#import "PPMyActivityViewController.h" //我的活动
#import "PPLoverViewController.h"  //我喜欢喜欢我知心人
#import "PPFeedBackViewController.h"


@interface PPMeViewController ()
@property (nonatomic, strong)PPMeModel *meModel;
@property (nonatomic, strong)NSArray *threeArr;
@property (nonatomic, strong)NSArray *fourArr;


@end

@implementation PPMeViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getMeData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView.tableHeaderView = self.mainHeaderView;
}

-(void)getMeData {
    [[PPNetTool share] get:Me_url parm:[NSDictionary dictionary] modelClass:[PPMeModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(PPMeModel *response) {
        self.meModel = response;
        self.titleLabel.text = response.userName;
        self.threeArr = [NSArray yy_modelArrayWithClass:[PPMeModel class] json:[self.meModel getThreeData]];
        self.fourArr = [NSArray yy_modelArrayWithClass:[PPMeModel class] json:[self.meModel getFourData]];
        [self.mainTableView reloadData];
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) {
        return self.threeArr.count?:1;
    }
    if (section == 4) {
        return self.fourArr.count?:1;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        PPMeTableViewOneCell *cell = [[PPMeTableViewOneCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPMeTableViewOneCellID"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PPMeTableViewOneCellID" forIndexPath:indexPath];
        }
        cell.meModel = self.meModel;
        cell.selectLabelBlock = ^(NSInteger tag) {
            //3我喜欢 2喜欢我1知心人
            PPLoverViewController *loveVC = [[PPLoverViewController alloc] init];
            loveVC.tag = tag;
            [self.navigationController pushViewController:loveVC animated:YES];
        };
        return cell;
    }
    if (indexPath.section == 2) {
        PPMeTableViewTwoCell *cell = [[PPMeTableViewTwoCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPMeTableViewTwoCellID"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PPMeTableViewTwoCellID" forIndexPath:indexPath];
        }
        cell.meModel = self.meModel;
        return cell;
    }
    if (indexPath.section == 0) {
         PPMeTableViewZeroCell *cell = [[PPMeTableViewZeroCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPMeTableViewZeroCellID"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PPMeTableViewZeroCellID" forIndexPath:indexPath];
        }
        cell.meModel = self.meModel;
        return cell;
       
    }
    PPMeTableViewCell *cell = [[PPMeTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPMeTableViewCellID"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"PPMeTableViewCellID" forIndexPath:indexPath];
    }
    if (indexPath.section == 3) {
        cell.model = self.threeArr[indexPath.row];
    }
    if (indexPath.section == 4) {
        cell.model = self.fourArr[indexPath.row];
    }
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 3) {
        return [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, 10*kHeight)];
    }
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    if (section == 3) {
        return 10*kHeight;
    }
    return 0.01;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PPMeDetailViewController *meVC = [[PPMeDetailViewController alloc] init];
        meVC.userId = [PPUser readUserID];
        [self.navigationController pushViewController:meVC animated:YES];
    }
    if (indexPath.section == 2) {
        PPTeamViewController *teamVC = [[PPTeamViewController alloc] init];
        teamVC.teamId = [PPUser readUserID];
        teamVC.teamType = PPTeamTypeMe;
        [self.navigationController pushViewController:teamVC animated:YES];
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            PPQcCodeViewController *codeVC = [[PPQcCodeViewController alloc] init];
            [self.navigationController pushViewController:codeVC animated:YES];
        }
        if (indexPath.row == 2) {
            //MARK:合作红娘
            PPGroupLoveController *groupVC = [[PPGroupLoveController alloc] init];
            [self.navigationController pushViewController:groupVC animated:YES];
        }
        if (indexPath.row == 3) {
            PPMyActivityViewController *activityVC = [[PPMyActivityViewController alloc] init];
            [self.navigationController pushViewController:activityVC animated:YES];
        }
    }
    if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            PPFeedBackViewController *feedVC = [[PPFeedBackViewController alloc] init];
            [self.navigationController pushViewController:feedVC animated:YES];
        }
        if (indexPath.row == 2) {
            //退出登录
            UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"" message:@"您确定要退出登录吗？" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                [PPUser removeAll];
                [[UIApplication sharedApplication] delegate].window.rootViewController = [[PPLoginViewController alloc] init];
            }];
            [alertVc addAction:cancle];
            [alertVc addAction:sure];
            [self presentViewController:alertVc animated:YES completion:nil];
            
        }
    }
}
@end
