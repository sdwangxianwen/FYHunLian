//
//  PPEditMeViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/10.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPEditMeViewController.h"
#import "PPEditTableViewCell.h"
#import "PPEditModel.h"
#import "PPPickerView.h"
#import "PPMeDetailTableViewCell.h"
#import "PPMeDetailModel.h"
#import "PPCharacterView.h"
#import "PPUserChart.h"
#import "PPChartModel.h"
#import "PPLoveAlertView.h"
#import "PPLoveModel.h"
#import "IndustryModel.h"
#import "PPMeDetailModel.h"

@interface PPEditMeViewController ()<PPPickerViewResultDelegate>
@property (nonatomic, strong)NSArray *sectionArr;
@property (nonatomic, strong)NSArray *ziliaoArr;
@property (nonatomic, strong)NSArray *jingliArr;
@property (nonatomic, strong)NSArray *lifeArr;
@property (nonatomic, strong)NSMutableArray *loveArr;
@property (nonatomic, strong)PPPickerView *pickView1;
@property (nonatomic, strong)PPPickerView *pickView2;
@property (nonatomic, strong)PPPickerView *pickView3;
@property (nonatomic, strong)zxUserHobbyModel *hobbyModel; //爱好
@property (nonatomic, strong)zxUserCharacterModel *chartModel; //性格
@property (nonatomic, strong)NSString *bloodType;//血型
@property (nonatomic, strong)NSString *height; //身高
@end

@implementation PPEditMeViewController

-(NSMutableArray *)loveArr {
    if (!_loveArr) {
        _loveArr = [NSMutableArray array];
    }
    return _loveArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleLabel];
    self.sectionArr = [NSArray yy_modelArrayWithClass:[PPEditModel class] json:[PPEditModel getSectionData]];
    self.ziliaoArr = [NSArray yy_modelArrayWithClass:[PPEditModel class] json:[PPEditModel getZiliaoData]];
    self.jingliArr = [NSArray yy_modelArrayWithClass:[PPEditModel class] json:[PPEditModel getJingliData]];
    self.lifeArr = [NSArray yy_modelArrayWithClass:[PPEditModel class] json:[PPEditModel getLifeData]];
    self.mainTableView.tableHeaderView = self.mainHeaderView;
    [self.mainTableView registerClass:[PPEditSectionView class] forHeaderFooterViewReuseIdentifier:@"PPEditSectionViewID"];
    self.mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, HOME_INDICATOR_HEIGHT)];
    self.titleLabel.text = @"编辑个人资料";
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //
    /*
     MARK:0组：头像和昵称
          1组：基本资料
          2组：爱好
          3组：性格
          4组：经历
          5组：生活
          6组：聊聊爱情
    */
    if (section == 0) {
        //头像和昵称
        return 2;
    }
    if (section == 1) {
        //基本资料
        return self.ziliaoArr.count;
    }
    if (section == 4) {
        return self.jingliArr.count;
    }
    if (section == 5) {
        return self.lifeArr.count;
    }
    if (section == 6) {
        return self.loveArr.count ? : 1;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 1) {
        PPEditNameCell *cell = [[PPEditNameCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPEditNameCellID"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PPEditNameCellID" forIndexPath:indexPath];
        }
        return cell;
    }
    if (indexPath.section == 1 || indexPath.section == 4 || indexPath.section == 5) {
        NSString *cellID = [NSString stringWithFormat:@"PPEditTableViewCellID%ld%ld",indexPath.row,indexPath.section];
        PPEditTableViewCell *cell = [[PPEditTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        }
        if (indexPath.section == 1) {
            cell.model = self.ziliaoArr[indexPath.row];
        }
        if (indexPath.section == 4) {
            cell.model = self.jingliArr[indexPath.row];
        }
        if (indexPath.section == 5) {
            cell.model = self.lifeArr[indexPath.row];
        }
        
        return cell;
    }
    if (indexPath.section == 2 || indexPath.section == 3) {
        PPMeDeatilTagCell *cell = [[PPMeDeatilTagCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPMeDeatilTagCellID"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PPMeDeatilTagCellID" forIndexPath:indexPath];
        }
        if (indexPath.section == 2) {
            cell.hobbyModel = self.hobbyModel;
        } else {
            cell.chartModel = self.chartModel;
        }
        return cell;
    }
    if (indexPath.section == 6) {
        ppeditLoveCell *cell = [[ppeditLoveCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ppeditLoveCellID"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"ppeditLoveCellID" forIndexPath:indexPath];
        }
        if (self.loveArr.count > 0) {
             cell.model = self.loveArr[indexPath.row];
        }
        return cell;
    }
    PPEditPhotoCell *cell = [[PPEditPhotoCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPEditPhotoCellID"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"PPEditPhotoCellID" forIndexPath:indexPath];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 5*kHeight;
    }
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *viw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, 5*kHeight)];
    viw.backgroundColor =[UIColor colorWithHex:0xF7F7F7];
    return viw;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section != 0) {
        return 30*kHeight;
    }
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }
    PPEditSectionView *sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"PPEditSectionViewID"];
    sectionView.frame = CGRectMake(0, 0, kScreenw, 20*kHeight);
    sectionView.contentView.backgroundColor = [UIColor whiteColor];
    sectionView.model = self.sectionArr[section];
    sectionView.userInteractionEnabled = YES;
    sectionView.tag = section;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionView:)];
    if (section == 3 || section == 2 || section == 6) {
        [sectionView addGestureRecognizer:tap];
    }
    return sectionView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [self initPickView:PPPickerViewTypeBloodType tag:indexPath.row section:indexPath.section];
        }
        if (indexPath.row == 1) {
            [self initPickView:PPPickerViewTypeHeight tag:indexPath.row section:indexPath.section];
        }
        if (indexPath.row == 2) {
            [self initPickView:PPPickerViewTypeWeight tag:indexPath.row section:indexPath.section];
        }
        if (indexPath.row == 4) {
            [self initPickView:PPPickerViewTypeNowAddress tag:indexPath.row section:indexPath.section];
        }
    }
    if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            [self initPickView:PPPickerViewTypeIndustry tag:indexPath.row section:indexPath.section]; // //行业
        }
        if (indexPath.row == 1) {
            [self initPickView:PPPickerViewTypePosition tag:indexPath.row section:indexPath.section]; // //职位
        }
        if (indexPath.row == 2) {
            [self initPickView:PPPickerViewTypeIncome tag:indexPath.row section:indexPath.section] ; // //收入
        }
        if (indexPath.row == 3) {
            [self initPickView:PPPickerViewTypeIndustry tag:indexPath.row section:indexPath.section]; // //毕业学校
        }
        if (indexPath.row == 4) {
            [self initPickView:PPPickerViewTypeEducation tag:indexPath.row section:indexPath.section]; // //学历
        }
        if (indexPath.row == 5) {
            [self initPickView:PPPickerViewTypeStatus tag:indexPath.row section:indexPath.section]; // //现状
        }
    }
    if (indexPath.section == 5) {
        if (indexPath.row == 0) {
            [self initPickView:PPPickerViewTypeHaveCar tag:indexPath.row section:indexPath.section];
        }
        if (indexPath.row == 1) {
             [self initPickView:PPPickerViewTypeHaveHouse tag:indexPath.row section:indexPath.section];
        }
    }

    [tableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ((indexPath.section == 1 && indexPath.row != 5) || indexPath.section == 4 || indexPath.section == 5) {
        return 30*kHeight;
    }
    if (indexPath.section == 2) {
        if (!self.hobbyModel.hobbyJson) {
            return 0.01;
        }
    }
    if (indexPath.section == 3) {
        if (!self.chartModel.characterJson) {
            return 0.01;
        }
    }
    if (indexPath.section == 6) {
        if (self.loveArr.count == 0) {
            return 0.01;
        }
    }
    return UITableViewAutomaticDimension;
}
-(void)sectionView:(UITapGestureRecognizer *)tap {
    NSLog(@"%ld",tap.view.tag);
    if (tap.view.tag == 2) {
        [PPCharacterView showWith:@"2" completion:^(NSArray * _Nonnull arr) {
            zxUserHobbyModel *hobbyModel = [[zxUserHobbyModel alloc] init];
            self.hobbyModel = hobbyModel;
            NSMutableString *json = [NSMutableString string];
            for (NSString *hobby in arr) {
                [json appendString:[NSString stringWithFormat:@"%@#",hobby]];
            }
            self.hobbyModel.hobbyJson = json;
            [self.mainTableView reloadData];
        }];
       
    }
    if (tap.view.tag == 3)  {
//        //性格
        [PPCharacterView showWith:@"1" completion:^(NSArray * _Nonnull arr){
            NSMutableString *chartString = [NSMutableString string];
            for (NSString *chart in arr) {
                [chartString appendString:[NSString stringWithFormat:@"%@#",chart]];
            }
            zxUserCharacterModel *model = [[zxUserCharacterModel alloc] init];
            self.chartModel = model;
            model.characterJson = chartString;
            [self.mainTableView reloadData];
        }];
    }
    if (tap.view.tag == 6) {
        //聊聊爱情
        PPLoveModel *lovemodel = [[PPLoveModel alloc] init];
        [PPLoveAlertView show:^(NSString *  porblem) {
            lovemodel.problemInfo = porblem;
            [PPEditAlertView show:porblem type:PPAlertTypeInput complete:^(NSString * text) {
                lovemodel.answer = text;
                [self.loveArr addObject:lovemodel];
                [self.mainTableView reloadData];
            }];
        }];

       
    }
    
   
}
-(void)initPickView:(PPPickerViewType)type tag:(NSInteger)tag section:(NSInteger)section {
    if (section == 1) {
        //基本资料
        _pickView1 = [[PPPickerView alloc] init];
        _pickView1.delegate = self;
        _pickView1.type = type;
        _pickView1.tag = tag;
        [self.view addSubview:_pickView1];
    }
    if (section == 4) {
        //经历
        _pickView2 = [[PPPickerView alloc] init];
        _pickView2.delegate = self;
        _pickView2.type = type;
        _pickView2.tag = tag;
        [self.view addSubview:_pickView2];
    }
    if (section == 5) {
        //生活
        _pickView3 = [[PPPickerView alloc] init];
        _pickView3.delegate = self;
        _pickView3.type = type;
        _pickView3.tag = tag;
        [self.view addSubview:_pickView3];
    }
    
    
}

-(void)pickerView:(UIView *)pickerView result:(id)result {
   
    if (pickerView == _pickView1) {
        PPEditModel *model = self.ziliaoArr[pickerView.tag];
        if ([result isKindOfClass:[IndustryModel class]]) {
            IndustryModel *stryModel = (IndustryModel *)result;
            model.subTitle = stryModel.name;
        } else {
            model.subTitle = result;
        }
    }
    if (pickerView == _pickView2) {
         PPEditModel *model = self.jingliArr[pickerView.tag];
        if ([result isKindOfClass:[IndustryModel class]]) {
            IndustryModel *stryModel = (IndustryModel *)result;
            model.subTitle = stryModel.name;
        } else {
            model.subTitle = result;
        }
    }
    if (pickerView == _pickView3) {
         PPEditModel *model = self.lifeArr[pickerView.tag];
        if ([result isKindOfClass:[IndustryModel class]]) {
            IndustryModel *stryModel = (IndustryModel *)result;
            model.subTitle = stryModel.name;
        } else {
            model.subTitle = result;
        }
    }

    
    [self.mainTableView reloadData];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[PPUserChart share].chartArrM removeAllObjects];
    [[PPUserChart share].hobbyArrM removeAllObjects];
}

@end
