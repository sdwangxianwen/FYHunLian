//
//  PPMyActivityViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/13.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPMyActivityViewController.h"
#import "PPActivityModel.h"
#import "PPActivityTableViewCell.h"
#import "PPWebViewController.h"

@interface PPMyActivityViewController ()
@property (nonatomic,assign)NSInteger pagNum;
@property (nonatomic, strong)NSArray *activityArr;

@end

@implementation PPMyActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView.tableHeaderView = self.mainHeaderView;
    self.titleLabel.text = @"我参与的";
    self.pagNum = 1;
    [self netWorking];
}

-(void)netWorking {
    NSDictionary *par = @{@"userToken" : [PPUser readUserToken] ? :@""};
    [[PPNetTool share] get:MeActivity_url parm:par modelClass:[PPActivityModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(PPActivityModel *response) {
        self.activityArr = response.list;
        [self.mainTableView reloadData];
        
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.activityArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PPActivityTableViewCell *cell = [[PPActivityTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPActivityTableViewCellID"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"PPActivityTableViewCellID" forIndexPath:indexPath];
    }
    cell.model = self.activityArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PPActivityListModel *model = self.activityArr[indexPath.row];
    PPWebViewController *webVC = [[PPWebViewController alloc] init];
    NSString *urlstr = [NSString stringWithFormat:@"http://info.pploved.com/activity.html?id=%@&userToken=%@",model.ID,[PPUser readUserToken]];
    webVC.url = urlstr;
    [self.navigationController pushViewController:webVC animated:YES];
}

@end
