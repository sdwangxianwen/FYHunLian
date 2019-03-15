//
//  PPTeamManagerController.m
//  pengpeng
//
//  Created by wang on 2019/3/13.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPTeamManagerController.h"
#import "PPTeamManagerCell.h"
#import "PPTeamModel.h"

@interface PPTeamManagerController ()
@property (nonatomic, strong)NSArray *membersArr;
@property (nonatomic, strong)NSArray *titleArr; //首字母的数组
@property (nonatomic, strong)NSDictionary *dataDict;

@end

@implementation PPTeamManagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView.tableHeaderView = self.mainHeaderView;
    self.titleLabel.text = @"队伍管理";
    [self netWorking];
}

-(void)netWorking {
    [SVProgressHUD show];
    NSMutableDictionary *troopmanagerDic =[[NSMutableDictionary alloc]init];
    [troopmanagerDic setObject:self.companyId forKey:@"groupId"];
    [troopmanagerDic setObject:@"1" forKey:@"pageNum"];
    NSString *userToken = [PPUser readUserToken];
    [FYNetworkHelper setValue:userToken?:@"" forHTTPHeaderField:@"userToken"];
    [FYNetworkHelper GET:TroopManager_url parameters:troopmanagerDic isCache:NO success:^(id responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject isKindOfClass:[NSDictionary class]] && [[responseObject valueForKey:@"status"] integerValue] == 200) {
            self.dataDict = responseObject[@"data"];
            self.titleArr = [self.dataDict allKeys];
            [self.mainTableView reloadData];
        }
    } failure:^(NSError *error, id cacheReponse) {
        [SVProgressHUD dismiss];
    }];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = self.titleArr[section];
    NSArray *arr = self.dataDict[key];
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = self.titleArr[indexPath.section];
    NSArray *arr = self.dataDict[key];
    NSArray *managerArr = [NSArray yy_modelArrayWithClass:[PPTeamManagerModel class] json:arr];
    if (indexPath.row == 0 && indexPath.section == 0) {
        PPTeamManagerMCell *cell = [[PPTeamManagerMCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPTeamManagerMCellID"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PPTeamManagerMCellID" forIndexPath:indexPath];
        }
        NSArray *arr = self.dataDict[@"0"];
        NSArray *manager = [NSArray yy_modelArrayWithClass:[PPTeamManagerModel class] json:arr];
        cell.troopmodel  = manager[indexPath.row];
        return cell;
    } else {
        PPTeamManagerCell *cell = [[PPTeamManagerCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPTeamManagerCellID"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PPTeamManagerCellID" forIndexPath:indexPath];
        }
        cell.troopmodel = managerArr[indexPath.row];
        @weakify(self);
        cell.clickkick = ^(NSString * _Nonnull memberId,NSString *name) {
//            [weak_self clickKick:memberId name:name];
        };
        cell.clicktransfer = ^(NSString * _Nonnull memberId,NSString *name) {
//            [block_self clickTransfer:memberId name:name];
        };
        return cell;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section != 0) {
        UIView *headerLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, 20)];
        headerLine.backgroundColor = [UIColor colorWithHex:0xF4F4F4];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, kScreenw  - 40, 20)];
        label.text = self.titleArr[section];
        label.textColor = [UIColor colorWithHex:0x6E6E6E];
        [headerLine addSubview:label];
        return headerLine;
    }
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section != 0) {
        return 20;
    }
    return 0.01;
}

@end
