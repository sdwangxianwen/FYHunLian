//
//  PPActivityViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPActivityViewController.h"
#import "PPActivityModel.h"
#import "PPActivityTableViewCell.h"
#import "PPWebViewController.h"

@interface PPActivityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign)NSInteger pageNUm;
@property (nonatomic,assign)NSInteger pageSize;
@property (nonatomic, strong)NSMutableArray *listArrM;


@end

@implementation PPActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageNUm = 1;
    [self setupUI];
    self.listArrM = [NSMutableArray array];
    [self getActivityList];
    
}

-(void)getActivityList {
    NSDictionary *parm = @{@"pageNum" : @(self.pageNUm),
                           @"pageSize" : @"10"
                           };
   
    [[PPNetTool share] get:GetActivityList parm:parm tableView:(self.mainTableView) modelClass:[PPActivityModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(PPActivityModel *response) {
        NSLog(@"%@",response.list);
        if (response.list && response.list.count > 0) {
            [self.listArrM addObjectsFromArray:response.list];
        } else {
            self.pageNUm--;
            if (self.pageNUm < 1) {
                self.pageNUm = 1;
            }
        }
        [self.mainTableView reloadData];
    }];
}
-(void)dropdownRefresh {
    [self.listArrM removeAllObjects];
    self.pageNUm = 1;
    [self getActivityList];
}
-(void)pullLoading {
    self.pageNUm ++;
    [self getActivityList];
    
}
-(void)setupUI {
    self.isRefresh = YES;
    self.mainTableView.tableHeaderView = self.mainHeaderView;
    self.titleLabel.text = @"活动";
   
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArrM.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PPActivityTableViewCell *cell = [[PPActivityTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPActivityTableViewCell"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"PPActivityTableViewCell" forIndexPath:indexPath];
    }
    if (self.listArrM.count > 0) {
        cell.model = self.listArrM[indexPath.row];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PPWebViewController *webVC = [[PPWebViewController alloc] init];
    PPActivityListModel *model = self.listArrM[indexPath.row];
    NSString *urlstr = [NSString stringWithFormat:@"http://info.pploved.com/activity.html?id=%@&userToken=%@",model.ID,[PPUser readUserToken]];
    webVC.url = urlstr;
    [self.navigationController pushViewController:webVC animated:YES];
}

@end
