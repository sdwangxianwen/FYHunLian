//
//  PPGroupLoveController.m
//  pengpeng
//
//  Created by wang on 2019/3/11.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPGroupLoveController.h"
#import "PPGroupLoveModel.h"
#import "PPGroupLoveTypeTableViewCell.h"
#import "PPApplyViewController.h" //企业红娘申请
#import "PPSearchGroupViewController.h" //寻找红娘
#import "PPTeamViewController.h"


@interface PPGroupLoveController ()
@property (nonatomic, strong)NSArray *typeArr;

@end
@implementation PPGroupLoveController
-(void)viewDidLoad {
    [super viewDidLoad];
    self.typeArr = [NSArray yy_modelArrayWithClass:[PPGroupLoveModel class] json:[PPGroupLoveModel hongniangData]];
    self.mainTableView.tableHeaderView = self.mainHeaderView;
    self.titleLabel.text = @"合作红娘";
    [self getUserpermissions];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.typeArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PPGroupLoveTypeTableViewCell *cell = [[PPGroupLoveTypeTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPGroupLoveTypeTableViewCellID"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"PPGroupLoveTypeTableViewCellID" forIndexPath:indexPath];
    }
    cell.model = self.typeArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PPGroupLoveModel *model = self.typeArr[indexPath.row];
    [self networking:indexPath.row +1 name:model.title];
}
-(void)networking:(NSInteger)type name:(NSString *)name{
    //1企业2学校3社团
    NSDictionary *parm = @{@"type" : @(type)};
    [[PPNetTool share] get:IsCompanyAdmin_url parm:parm modelClass:[PPBaseModel class] isCache:NO isShowLoadHUD:YES isShowErrorHUD:YES success:^(PPBaseModel *response) {
        NSLog(@"%ld",(long)response.data);
        PPTeamViewController *teamVc = [[PPTeamViewController alloc] init];
        teamVc.teamType = PPTeamTypeGroupMember;
        if (response.data == 0) {
            //不是管理员，但存在自己的公司
            if (type == 1 && self.permissionsModel.companyId) {
                //有自己的公司
                teamVc.teamId = self.permissionsModel.companyId;
                [self.navigationController pushViewController:teamVc animated:YES];
            } else if (type == 2 && self.permissionsModel.schoolId) {
                //有自己的学校
                 teamVc.teamId = self.permissionsModel.schoolId;
                [self.navigationController pushViewController:teamVc animated:YES];
            } else if (type == 3 && self.permissionsModel.groupsId) {
                //有自己的团队
                 teamVc.teamId = self.permissionsModel.groupsId;
                [self.navigationController pushViewController:teamVc animated:YES];
            } else {
                NSString *alertInfo = [NSString stringWithFormat:@"您暂未加入%@队伍，请申请开通 队伍或寻找队伍加入",name];
                [PPEditAlertView showTitle:alertInfo sureString:@"寻找队伍" sureBlock:^{
                    PPSearchGroupViewController *searchVC = [[PPSearchGroupViewController alloc] init];
                    [self.navigationController pushViewController:searchVC animated:YES];
                    
                } cancle:@"立即申请" cancleBlock:^{
                    PPApplyViewController *applyVC = [[PPApplyViewController alloc] init];
                    applyVC.typeName = name;
                    [self.navigationController pushViewController:applyVC animated:YES];
                }];
            }
        } else {
            //是管理员
            PPTeamViewController *teamVc = [[PPTeamViewController alloc] init];
            teamVc.teamType = PPTeamTypeGroupManager;
            if (type == 1 && self.permissionsModel.companyId) {
                //有自己的公司
                teamVc.teamId = self.permissionsModel.companyId;
                [self.navigationController pushViewController:teamVc animated:YES];
            } else if (type == 2 && self.permissionsModel.schoolId) {
                //有自己的学校
                teamVc.teamId = self.permissionsModel.schoolId;
                [self.navigationController pushViewController:teamVc animated:YES];
            } else if (type == 3 && self.permissionsModel.groupsId) {
                //有自己的团队
                teamVc.teamId = self.permissionsModel.groupsId;
                [self.navigationController pushViewController:teamVc animated:YES];
            }
            
        }
    }];
}
@end
