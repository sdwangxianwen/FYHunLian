//
//  PPCharacterView.m
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPCharacterView.h"
#import "PPChartModel.h"


static NSString *const PPChartCellid = @"PPChartCellid";
@interface PPCharacterView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIView *backView;
@property (nonatomic, strong)UITableView *chartTableview;
@property (nonatomic, strong)UIView *coverView;
@property (nonatomic, strong)UIView *footerView;
@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)NSArray *tagArr; //标签数组
@property (nonatomic, strong)NSMutableArray *selectedTagArrM ; //选中的标签
@property (nonatomic, strong)NSString *type;
@property (nonatomic, strong)UILabel *headerLabel;

@end

@implementation PPCharacterView

-(NSMutableArray *)selectedTagArrM {
    if (!_selectedTagArrM) {
        _selectedTagArrM = [NSMutableArray array];
    }
    return _selectedTagArrM;
}

-(instancetype)initWithFrame:(CGRect)frame type:(nonnull NSString *)type {
    self = [super initWithFrame:frame];
    if (self) {
        self.type = type;
        [self coverView];
        [self backView];
        [self chartTableview];
        [self footerView];
        [self netWorking];
    }
    return self;
}

-(void)coverViewClick{
    [self cancleBtnClick];
}

-(void)netWorking {
    NSDictionary *parm = @{@"type" : self.type};
    [[PPNetTool share] get:GetMeTag_url parm:parm modelClass:[PPChartModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(NSArray *response) {
        FYLog(@"%@",response);
        self.tagArr = response;
        [self.chartTableview reloadData];
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tagArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PPChartCell *cell = [tableView dequeueReusableCellWithIdentifier:PPChartCellid forIndexPath:indexPath];
    cell.model = self.tagArr[indexPath.row];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40*kHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PPChartModel *model = self.tagArr[indexPath.row];
    if (model.isSelected) {
        //如果是选中的
        model.isSelected = NO;
        [self.selectedTagArrM removeObject:model.info];
    } else {
        if (self.selectedTagArrM.count >= 6) {
            [SVProgressHUD showErrorWithStatus:@"只能选择6个标签"];
        } else {
            model.isSelected = YES;
            [self.selectedTagArrM addObject:model.info];
        }
       
    }
    self.headerLabel.text = [NSString stringWithFormat:@"选择标签(%lu/6)",(unsigned long)self.selectedTagArrM.count];
    [tableView reloadData];
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

-(UITableView *)chartTableview {
    if (!_chartTableview) {
        _chartTableview = [[UITableView alloc] initWithFrame:CGRectMake(27*kWidth, 122*kHeight, kScreenw - 54*kWidth, 400*kHeight)];
        [self addSubview:_chartTableview];
        _chartTableview.delegate = self;
        _chartTableview.dataSource = self;
        _chartTableview.separatorStyle = UITableViewCellSelectionStyleNone;
        [_chartTableview registerClass:[PPChartCell class] forCellReuseIdentifier:PPChartCellid];
        _chartTableview.showsVerticalScrollIndicator = NO;
        _chartTableview.showsHorizontalScrollIndicator = NO;
        
    }
    return _chartTableview;
}

-(UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw - 54*kWidth, 40*kHeight)];
        _headerView.backgroundColor = [UIColor whiteColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16*kWidth, 0, _headerView.fy_width - 32*kWidth, 40*kHeight)];
        label.text = [NSString stringWithFormat:@"选择标签(%lu/6)",(unsigned long)self.selectedTagArrM.count];
        self.headerLabel = label;
        [_headerView addSubview:label];
        label.textColor = [UIColor colorWithHex:0x3e3e3e];
        label.font = [UIFont systemFontOfSize:16];
        [self addSubview:_headerView];
    }
    return _headerView;
}
-(UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.chartTableview.height, self.chartTableview.width, 59*kHeight)];
        [self.backView addSubview:_footerView];
        
        UIButton *sureBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [sureBtn setTitle:@"选好了" forState:(UIControlStateNormal)];
        [sureBtn setTitleColor:[UIColor colorWithHex:0xAB5CFD] forState:(UIControlStateNormal)];
        sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
        [_footerView addSubview:sureBtn];
        [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-32);
            make.centerY.equalTo(self.footerView);
            make.width.mas_equalTo(44);
        }];
        
        UIButton *cancleBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [cancleBtn setTitle:@"取消" forState:(UIControlStateNormal)];
        [cancleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
        [cancleBtn setTitleColor:[UIColor colorWithHex:0xAB5CFD] forState:(UIControlStateNormal)];
        cancleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_footerView addSubview:cancleBtn];
        [cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(sureBtn.mas_left).offset(-30*kWidth);
            make.centerY.equalTo(self.footerView);
        }];
    }
    return _footerView;
}
//MARK:取消
-(void)cancleBtnClick {
    [self.selectedTagArrM removeAllObjects];
    [PPCharacterView disMiss];
}
//MARK:选好了
-(void)sureBtnClick {
    if (self.complete) {
        self.complete(self.selectedTagArrM.copy);
        [self.selectedTagArrM removeAllObjects];
    }
    [PPCharacterView disMiss];
}

+(void)showWith:(NSString *)type completion:(nonnull complete)completion  {
    PPCharacterView *chartView = [[PPCharacterView alloc] initWithFrame:[UIScreen mainScreen].bounds type:type];
    [[UIApplication sharedApplication].keyWindow addSubview:chartView];
    [self getView].complete = completion;
   
}
+ (PPCharacterView *)getView {
    NSEnumerator *subviewsEnum = [[UIApplication sharedApplication].keyWindow.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            PPCharacterView *alertView = (PPCharacterView *)subview;
            return alertView;
        }
    }
    return nil;
}
+(void)disMiss {
    [[self getView] removeFromSuperview];
}

@end


@interface PPChartCell ()
@property (nonatomic, strong)UIButton *tagBtn;
@property (nonatomic, strong)UILabel *titleLbael;
@end

@implementation PPChartCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
-(UIButton *)tagBtn {
    if (!_tagBtn) {
        _tagBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:_tagBtn];
        _tagBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_tagBtn setTitleColor:[UIColor colorWithHex:0x3e3e3e] forState:(UIControlStateNormal)];
        [_tagBtn setImage:[UIImage imageNamed:@"chart_nromal"] forState:(UIControlStateNormal)];
        [_tagBtn setImage:[UIImage imageNamed:@"chart_select"] forState:(UIControlStateSelected)];
        _tagBtn.userInteractionEnabled = NO;
        [_tagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(29*kWidth);
            make.centerY.equalTo(self);
        }];
    }
    return _tagBtn;
}
-(UILabel *)titleLbael {
    if (!_titleLbael) {
        _titleLbael = [[UILabel alloc] init];
        _titleLbael.font = [UIFont systemFontOfSize:13];
        _titleLbael.textColor = [UIColor colorWithHex:0x3e3e3e];
        [self.contentView addSubview:_titleLbael];
        [_titleLbael mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self.tagBtn.mas_right).offset(23*kWidth);
        }];
    }
    return _titleLbael;
}
-(void)setModel:(PPChartModel *)model {
    _model = model;
    self.titleLbael.text = model.info;
    self.tagBtn.selected = model.isSelected;
}

@end
