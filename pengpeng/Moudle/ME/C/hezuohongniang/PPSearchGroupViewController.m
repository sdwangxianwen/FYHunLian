//
//  PPSearchGroupViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPSearchGroupViewController.h"

@interface PPSearchGroupViewController ()

@end

@implementation PPSearchGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView.tableHeaderView = self.mainHeaderView;
    self.titleLabel.text = @"合作红娘";
}



@end
