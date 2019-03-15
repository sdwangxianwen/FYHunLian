//
//  PPQcCodeViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPQcCodeViewController.h"
#import "PPCodeModel.h"

@interface PPQcCodeViewController ()<ZJScrollPageViewDelegate>
@property(strong, nonatomic)NSArray<NSString *> *titles;
@property (nonatomic, strong) ZJScrollPageView *scrollPageView;
@end

@implementation PPQcCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}

-(void)setupUI {
     ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    // 颜色渐变
    style.showLine = YES;
    style.scrollLineColor = [UIColor redColor];
    style.gradualChangeTitleColor = YES;
//    style.scrollTitle = NO;
    style.normalTitleColor = [UIColor colorWithHex:0xa2a2a2];
    style.selectedTitleColor = [UIColor colorWithHex:0x3e3e3e];
    style.titleFont = [UIFont systemFontOfSize:18];
    
    self.titles = @[@"我的队伍",
                    @"企业队伍",
                    @"高校队伍",
                    @"团体队伍",
                    ];
    // 初始化
    _scrollPageView.segmentView.backgroundImage = [UIImage imageNamed:@"team_header"];
    _scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, NavBarHight, self.view.bounds.size.width, self.view.bounds.size.height - NavBarHight) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    _scrollPageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_scrollPageView];
}
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}
- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(PPQcCodeSubViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    NSArray *arr = @[@"1",@"2",@"2",@"2"];
    PPQcCodeSubViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    
    if (!childVc) {
        childVc = [[PPQcCodeSubViewController alloc] init];
        childVc.type = arr[index];
        childVc.view.tag = index;
    }
    return childVc;
}


@end

@interface PPQcCodeSubViewController (){
    UIImageView *_codeImageview;
    UIImageView *_coderBorderView;
}

@end
@implementation PPQcCodeSubViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self netWorking];
    
    _coderBorderView = [[UIImageView alloc] init];
    [self.view addSubview:_coderBorderView];
    _coderBorderView.image = [UIImage imageNamed:@"code_border"];
    [_coderBorderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(33*kHeight);
        make.centerX.equalTo(self.view);
        make.height.width.mas_equalTo(248*kHeight);
    }];
    _codeImageview =[[UIImageView alloc] init];
    [_coderBorderView addSubview:_codeImageview];
    [_codeImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self->_coderBorderView);
        make.height.width.mas_equalTo(199*kHeight);
    }];
    
    [self initBottomView];
}
-(void)initBottomView {
    
    UIView *bottomView = [[UIView alloc] init];
    [self.view addSubview:bottomView];
    bottomView.backgroundColor = [UIColor colorWithHex:0x000000];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.offset(0);
        make.size.mas_equalTo(CGSizeMake(kScreenw, 140*kHeight + HOME_INDICATOR_HEIGHT));
    }];
    CGFloat btnW = 42;
    CGFloat btnH = 80;
    CGFloat btnY = 33*kHeight;
    CGFloat margin = (kScreenw - btnW*2)/3;
    NSArray *titles = @[@"微信", @"朋友圈"];
    NSArray *images = @[@"sharechat",@"shareFriend"];
    for (NSInteger i = 0; i < 2; i++) {
        CGFloat btnX = margin*(i+1) + btnW*i;
        JMBaseButtonConfig *config = [JMBaseButtonConfig buttonConfig];
        config.styleType = JMButtonStyleTypeTop;
        config.titleColor = [UIColor redColor];
        config.padding = 22;
        config.titleFont = [UIFont systemFontOfSize:15];
        config.title = titles[i];
        config.image = [UIImage imageNamed:images[i]];
        config.backgroundColor = [UIColor clearColor];
        
        JMBaseButton *btn = [[JMBaseButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnW, btnH) ButtonConfig:config];
        [bottomView addSubview:btn];
    }
    
    UILabel *lable = [[UILabel alloc] init];
    [self.view addSubview:lable];
    lable.text = @"可分享至";
    lable.font = [UIFont systemFontOfSize:15];
    lable.textColor = [UIColor colorWithHex:0x3e3e3e];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(11*kWidth);
        make.bottom.equalTo(bottomView.mas_top).offset(-18*kHeight);
    }];
}
-(void)netWorking {
    NSDictionary *parm = @{@"type" : self.type};
    [[PPNetTool share] get:QR_url parm:parm modelClass:[PPCodeModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(PPCodeModel *response) {
        NSString *codeString = @"";
        if (self.view.tag == 0) {
            //个人
            codeString = response.personalQRCode;
        }
        if (self.view.tag == 1) {
            //个人
            codeString = response.enterpriseQRCode;
        }
        if (self.view.tag == 2) {
            //个人
            codeString = response.schoolQRCode;
        }
        if (self.view.tag == 3) {
            //个人
            codeString = response.groupRCode;
        }
        [self->_codeImageview sd_setImageWithURL:[NSURL URLWithString:codeString] placeholderImage:[UIImage imageNamed:@"banner_place"]];
    }];
}

@end
