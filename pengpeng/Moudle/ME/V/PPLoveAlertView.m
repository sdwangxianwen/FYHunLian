//
//  PPLoveAlertView.m
//  pengpeng
//
//  Created by wang on 2019/3/11.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPLoveAlertView.h"
#import "PPLoveModel.h"

@interface PPLoveAlertView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIView *backView;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIView *coverView;
@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)NSArray *loveArr;

@end

@implementation PPLoveAlertView

+(void)show:(proBlock)proBlock {
    PPLoveAlertView *alertView = [[PPLoveAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
    [PPLoveAlertView getView].proBlock = proBlock;
}

+ (PPLoveAlertView *)getView {
    NSEnumerator *subviewsEnum = [[UIApplication sharedApplication].keyWindow.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            PPLoveAlertView *alertView = (PPLoveAlertView *)subview;
            return alertView;
        }
    }
    return nil;
}
+(void)disMiss {
    [[self getView] removeFromSuperview];
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self netWorking];
        [self coverView];
        [self backView];
        [self headerView];
        [self tableView];
    }
    return self;
}

-(void)netWorking {
    [[PPNetTool share] get:ZxQaProblem_url parm:[NSDictionary dictionary] modelClass:[PPLoveModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(NSArray *response) {
        self.loveArr = response;
        [self.tableView reloadData];
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.loveArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PPLoveAlertViewCell *cell = [[PPLoveAlertViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPLoveAlertViewCellID"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"PPLoveAlertViewCellID" forIndexPath:indexPath];
    }
    cell.model = self.loveArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PPLoveModel *model = self.loveArr[indexPath.row];
    if (self.proBlock) {
        self.proBlock(model.problemInfo);
    }
     [PPLoveAlertView disMiss];
}

-(void)coverViewClick{
    [PPLoveAlertView disMiss];
}

-(UIView *)coverView {
    if (!_coverView) {
        _coverView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:_coverView];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.3;
        _coverView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverViewClick)];
        [_coverView addGestureRecognizer:tap];
    }
    return _coverView;
}
-(UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(27*kWidth, 120*kHeight, kScreenw - 54*kWidth, 459*kHeight)];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.cornerRadius = 5;
        _backView.clipsToBounds = YES;
        [self addSubview:_backView];
    }
    return _backView;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40*kHeight, kScreenw - 54*kWidth, 400*kHeight)];
        [_backView addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tableView.estimatedRowHeight = 200;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
    }
    return _tableView;
}

-(UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw - 54*kWidth, 40*kHeight)];
        _headerView.backgroundColor = [UIColor whiteColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16*kWidth, 0, _headerView.fy_width - 32*kWidth, 40*kHeight)];
        label.text = @"聊聊爱情";;
        [_headerView addSubview:label];
        label.textColor = [UIColor colorWithHex:0x3e3e3e];
        label.font = [UIFont systemFontOfSize:16];
        [self.backView addSubview:_headerView];
    }
    return _headerView;
}


@end

@implementation PPLoveAlertViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_titleLabel];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = [UIColor colorWithHex:0x3e3e3e];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(44*kWidth);
            make.right.offset(-15*kWidth);
            make.top.offset(10);
            make.bottom.offset(-10);
        }];
    }
    return _titleLabel;
}

-(void)setModel:(PPLoveModel *)model {
    _model = model;
    self.titleLabel.text = model.problemInfo;
}
@end
