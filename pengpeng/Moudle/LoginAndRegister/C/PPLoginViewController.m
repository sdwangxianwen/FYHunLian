//
//  PPLoginViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPLoginViewController.h"
#import "PPLoginView.h"


@interface PPLoginViewController ()
@property (nonatomic, strong)PPLoginView *loginView;
@end

@implementation PPLoginViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self loginView];
}

-(PPLoginView *)loginView {
    if (!_loginView) {
        _loginView = [[PPLoginView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_loginView];
    }
    return _loginView;
}

@end
