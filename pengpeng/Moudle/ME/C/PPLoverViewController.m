//
//  PPLoverViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/14.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPLoverViewController.h"
#import "PPLoveTableViewCell.h"
#import "PPLoveListModel.h"
#import "PPMeDetailViewController.h"

@interface PPLoverViewController ()
@property (nonatomic, strong)NSMutableArray *loverArr;
@property (nonatomic,assign)NSInteger pageNum;
@end

@implementation PPLoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageNum = 1;
    self.loverArr = [NSMutableArray array];
    self.isRefresh = YES;
    self.mainTableView.tableHeaderView = self.mainHeaderView;
    if (self.tag == 3) {
        self.titleLabel.text = @"我喜欢";
    } else if (self.tag == 2) {
        self.titleLabel.text = @"喜欢我";
    }else {
        self.titleLabel.text = @"知心人";
    }
    [self netWorking];
}

-(void)dropdownRefresh {
    self.pageNum = 1;
    [self.loverArr removeAllObjects];
    [self netWorking];
}
-(void)pullLoading {
    self.pageNum ++;
    [self netWorking];
}

-(void)netWorking{
    NSDictionary *par = @{@"type": @(self.tag),
                          @"pageNum" : @(self.pageNum)
                          };
    [[PPNetTool share] get:Friend_url parm:par tableView:self.mainTableView modelClass:[PPLoveListModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(NSArray *response) {
        if (response.count > 0) {
            [self.loverArr addObjectsFromArray:response];
        } else {
            self.pageNum = MAX(1, self.pageNum--);
        }
        [self.mainTableView reloadData];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.loverArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PPLoveTableViewCell *cell = [[PPLoveTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPLoveTableViewCellID"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"PPLoveTableViewCellID" forIndexPath:indexPath];
    }
    cell.listModel = self.loverArr[indexPath.row];
    if (self.tag == 3) {
        cell.identityImageView.image = [UIImage imageNamed:@"love_red"];
    }
    if (self.tag == 2) {
        cell.identityImageView.image = [UIImage imageNamed:@"love_yellow"];
    }
    if (self.tag == 1) {
        cell.identityImageView.image = [UIImage imageNamed:@"love_two"];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PPMeDetailViewController *meVC = [[PPMeDetailViewController alloc] init];
    PPLoveListModel *model = self.loverArr[indexPath.row];
    meVC.userId = model.userId;
    [self.navigationController pushViewController:meVC animated:YES];
}

@end
