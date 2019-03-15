//
//  PPPickerView.m
//  PengPeng
//
//  Created by edz on 2018/12/11.
//  Copyright © 2018年 pengpeng. All rights reserved.
//

#import "PPPickerView.h"
#import "IndustryModel.h"
@interface PPPickerView ()

@property (nonatomic,strong) UIView *bgView;

@property(nonatomic,strong) UIButton *cancelBtn;

@property(nonatomic,strong) UIButton *completeBtn;

@property(nonatomic,strong) UILabel *titleLab;

@property(nonatomic,strong) UIView *line;

@property(nonatomic,assign) NSInteger selectIndex;

@property (nonatomic, copy) dispatch_block_t maskBlock;

@property (nonatomic, strong) UIButton *bgBtn;

@end

@implementation PPPickerView

-(UIPickerView *)picker
{
    if (!_picker) {
        _picker = [[UIPickerView alloc]init];
        
        _picker.delegate = self;
        
        _picker.dataSource = self;
    }
    return _picker;
}

- (UIDatePicker *)datePicker{
    
    if (!_datePicker) {
        
        _datePicker = [UIDatePicker new];
    }
    
    return _datePicker;
}

- (NSMutableArray *)array{
    if (!_array) {
        
        _array = [NSMutableArray array];
        
    }
    return _array;
}
- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        [self initUI];
        
    }
    
    return self;
}


- (void)initUI{
    
    [self addSubview:self.bgBtn];
    [self.bgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.frame = [UIScreen mainScreen].bounds;
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, kScreenw, 280*kHeight)];
    [self.bgBtn addSubview:_bgView];
    _bgView.tag = 6000;
    _bgView.backgroundColor = [UIColor whiteColor];
    [self showAnimation];
    
    
    //取消
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bgView addSubview:self.cancelBtn];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(44);
        
    }];
    self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:[UIColor colorWithHex:0xAB56FD] forState:UIControlStateNormal];
    [self.cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //完成
    self.completeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bgView addSubview:self.completeBtn];
    [self.completeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(44);
        
    }];
    self.completeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.completeBtn setTitleColor:[UIColor colorWithHex:0xAB56FD] forState:UIControlStateNormal];
    [self.completeBtn addTarget:self action:@selector(completeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
 
    self.titleLab = [[UILabel alloc] init];
    self.titleLab.textColor = [UIColor colorWithHex:0x3e3e3e];
    self.titleLab.font = [UIFont systemFontOfSize:15];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bgView.mas_centerX);
        make.centerY.mas_equalTo(self.completeBtn.mas_centerY);
    }];
    
    
    self.line = [[UIView alloc]init];
    
    [self.bgView addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.cancelBtn.mas_bottom).offset(0);
        make.left.right.mas_equalTo(0);
        make.width.mas_equalTo(kScreenw);
        make.height.mas_equalTo(0.5);
        
    }];
    self.line.backgroundColor = [UIColor colorWithHex:0x3e3e3e];
}


#pragma mark  type

-(void)setType:(PPPickerViewType)type
{
    _type = type;
    
    switch (type) {
        case PPPickerViewTypeBirthday:
            
            self.titleLab.text = @"选择出生日期";
            [self isDataPicker:YES];
            
            break;
            
        case PPPickerViewTypeSex:
            self.titleLab.text = @"选择性别";
            [self sexData];
            [self isDataPicker:NO];
            
            break;
            
        case PPPickerViewTypeMaritalStatus:
            
            self.titleLab.text = @"选择婚姻情况";
            [self MaritalData];
            [self isDataPicker:NO];
            
            break;
            
        case PPPickerViewTypeHaveChild:
            
            self.titleLab.text = @"选择生活状况";
            [self HaveChildData];
            [self isDataPicker:NO];
            
            break;
            
        case PPPickerViewTypeBloodType:
            self.titleLab.text = @"选择血型";
            [self BloodTypeData];
            [self isDataPicker:NO];
            
            break;
            
        case PPPickerViewTypeHeight:
            
            self.titleLab.text = @"选择身高";
            [self heightData];
            [self isDataPicker:NO];
            [self.picker selectRow:70 inComponent:0 animated:NO];
            
            break;
        case PPPickerViewTypeWeight:
            
            self.titleLab.text = @"选择体重";
            [self weightData];
            [self isDataPicker:NO];
            [self.picker selectRow:20 inComponent:0 animated:NO];
            
            break;
            
            
        case PPPickerViewTypeIndustry:
            self.titleLab.text =@"选择行业";
            [self IndusttyData];
            [self isDataPicker:NO];
            
            break;
            
        case PPPickerViewTypePosition:
            self.titleLab.text = @"选择职位";
            if (!kStringIsEmpty(self.IndustryID)) {
                [self PositionData:self.IndustryID];
            }
            
            [self isDataPicker:NO];
            
            break;
            
        case PPPickerViewTypeIncome:
            self.titleLab.text =@"选择收入";
            [self IncomeData];
            [self isDataPicker:NO];
            
            break;
            
        case PPPickerViewTypeEducation:
            self.titleLab.text =@"选择最高学历";
            [self EducationData];
            [self isDataPicker:NO];
            
            break;
            
        case PPPickerViewTypeStatus:
            self.titleLab.text =@"选择现状";
            [self NowStatusData];
            [self isDataPicker:NO];
            
            break;
            
        case PPPickerViewTypeHaveCar:
            self.titleLab.text =@"是否有车";
            [self IsHavaCarData];
            [self isDataPicker:NO];
            
            break;
            
        case PPPickerViewTypeHaveHouse:
            self.titleLab.text = @"是否有房";
            [self IsHavaHouseData];
            [self isDataPicker:NO];
            
            break;
            
        default:
            break;
    }
}



-(void)setSelectComponent:(NSInteger)selectComponent
{
    _selectComponent = selectComponent;
    [self.picker selectRow:selectComponent inComponent:0 animated:NO];
}


-(void)isDataPicker:(BOOL)isData{
    if (isData) {
        [_bgView addSubview:self.datePicker];
        [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.line.mas_bottom).offset(0);
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
        
    }else{
        [_bgView addSubview:self.picker];
        [self.picker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.line.mas_bottom).offset(0);
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
    }
}

#pragma mark Click
//单击取消
-(void)cancelBtnClick{
    
    [self hideAnimation];
}

//单击了完成按钮
-(void)completeBtnClick{
    
    [self hideAnimation];
    
    NSString *resultStr = [NSString string];
    //行业/职位
    if (self.type == PPPickerViewTypeIndustry) {
        
        IndustryModel * industrymodel = [self.array objectAtIndex:self.selectIndex];
        
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerView:result:)]) {
            
            [self.delegate pickerView:self result:industrymodel];
        }
    }else if (self.type == PPPickerViewTypePosition)
    {
     
        IndustryModel * industrymodel = [self.array objectAtIndex:self.selectIndex];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerView:result:)]) {
            
            [self.delegate pickerView:self result:industrymodel];
        }
        
    }else if (self.type == PPPickerViewTypeIncome) {
        if (!kArrayIsEmpty(self.array)) {
            NSArray *incomeArr = self.array[0];
            NSString *industryStr = [incomeArr objectAtIndex:self.selectIndex];
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(pickerView:result:)]) {
                
                [self.delegate pickerView:self result:industryStr];
            }
        }
        
        
    }else
    {
        for (int i = 0; i < self.array.count; i++) {
            
            NSArray *arr = [self.array objectAtIndex:i];
            NSString *str = [arr objectAtIndex:[self.picker selectedRowInComponent:i]];
            
            resultStr = [resultStr stringByAppendingString:str];
        }
        
        if (_delegate && [_delegate respondsToSelector:@selector(pickerView:result:)]) {
            [_delegate pickerView:self result:resultStr];
        }
    }
}

#pragma mark - 模拟数据

//出生日期

//性别数据
-(void)sexData{
    
    [self.array addObject:@[@"男",@"女"]];
}

//婚姻状态数据
-(void)MaritalData
{
    [self.array addObject:@[@"未婚",@"已婚",@"离异",@"丧偶"]];
}

//生活状况数据
-(void)HaveChildData
{
    [self.array addObject:@[@"有子女",@"无子女"]];
}

//血型
-(void)BloodTypeData
{
    [self.array addObject:@[@"A",@"B",@"AB",@"O"]];
}

//身高数据
-(void)heightData{
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 100; i <= 300; i++) {
        NSString *str = [NSString stringWithFormat:@"%d cm",i];
        [arr addObject:str];
    }
    [self.array addObject:arr];
}

//体重
-(void)weightData
{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 30; i<= 150; i++) {
        
        NSString *str = [NSString stringWithFormat:@"%d kg",i];
        [arr addObject:str];
    }
    [self.array addObject:(NSArray *)arr];
}


//户口

//现居地

//选择行业
-(void)IndusttyData {
    [[PPNetTool share] get:GetIndustry_url parm:[NSDictionary dictionary] modelClass:[IndustryModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(NSArray *response) {
         [self.array addObjectsFromArray:response];
        [self.picker reloadAllComponents];
        
    }];
}

//选择职位
-(void)PositionData:(NSString *)ID
{
    NSMutableDictionary *positionDic = [[NSMutableDictionary alloc]init];
    [positionDic setObject:ID forKey:@"industryId"];
    [[PPNetTool share] get:GetOccupation_url parm:positionDic modelClass:[IndustryModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(NSArray *response) {
        [self.array addObjectsFromArray:response];
        [self.picker reloadAllComponents];
    }];
}

//收入数据
-(void)IncomeData{
    [self.array addObject:@[@"10k以下",@"10k~20k",@"20k~30k",@"30k~50k",@"50k以上"]];
}

//选择学历
-(void)EducationData{
    [self.array addObject:@[@"专科",@"本科",@"硕士",@"博士"]];
}

//现状
-(void)NowStatusData{
    [self.array addObject:@[@"学生",@"已工作",@"待业"]];
}

//是否有车
-(void)IsHavaCarData{
    [self.array addObject:@[@"有车",@"暂无"]];
}

//是否有房
-(void)IsHavaHouseData{
    [self.array addObject:@[@"有房",@"暂无"]];
}

#pragma mark - event

- (void)dismiss{
    
    [self hideAnimation];
    if (self.maskBlock) {
        self.maskBlock();
    }
}

-(void)showAnimation {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.bgView.frame;
        frame.origin.y = self.frame.size.height - 260*kHeight;
        self.bgView.frame = frame;
    }];
}


-(void)hideAnimation {
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect frame = self.bgView.frame;
        frame.origin.y = self.frame.size.height;
        self.bgView.frame = frame;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
        [self.bgView removeFromSuperview];
        [self removeFromSuperview];
    }];
}


#pragma mark -- UIPickerViewDataSource

//列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //行业/职位
    if (self.type == PPPickerViewTypeIndustry || self.type == PPPickerViewTypePosition || self.type == PPPickerViewTypeIncome || self.type == PPPickerViewTypeEducation || self.type == PPPickerViewTypeStatus) {
        
        return 1;
        
    }else
    {
        return self.array.count;
    }
    
}

//指定列包含多少个列表项
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (self.type == PPPickerViewTypeIndustry) {
        
        return self.array.count;
        
    }else if (self.type == PPPickerViewTypePosition)
    {
        return self.array.count;
        
    }else
    {
        NSArray *arr = (NSArray *)[self.array objectAtIndex:component];
        
        return arr.count;
    }
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (self.type == PPPickerViewTypeIndustry || self.type == PPPickerViewTypePosition) {
        IndustryModel *model = [self.array objectAtIndex:row];
        return model.name;
    } else {
        NSArray *arr = (NSArray *)[self.array objectAtIndex:component];
        return [arr objectAtIndex:row % arr.count];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.selectIndex =  [pickerView selectedRowInComponent:0];
        [pickerView reloadAllComponents];
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return kScreenw;
}

//防止崩溃
-(NSUInteger)indexOfNSArray:(NSArray *)arr WithStr:(NSString *)str{
    NSUInteger chosenDxInt = 0;
    if (str && ![str isEqualToString:@""]) {
        chosenDxInt = [arr indexOfObject:str];
        if (chosenDxInt == NSNotFound) {
            chosenDxInt = 0;
        }
    }
    return chosenDxInt;
}

-(void)formatterRangeAry{
    
    NSMutableArray *rang = [self.array mutableCopy];
    
    [self.array removeAllObjects];
    
    for (int i = 0; i<rang.count - 1; i++) {
        
        [self.array addObject:rang];
    }
}


- (void)pickViewClickMaskHandler:(void(^)(void))handler{
    
    self.maskBlock = handler;
}

- (UIButton *)bgBtn {
    if (!_bgBtn) {
        _bgBtn = [[UIButton alloc] init];
        _bgBtn.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2f];;
        [_bgBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bgBtn;
}
@end
