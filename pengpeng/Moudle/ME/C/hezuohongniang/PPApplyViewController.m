//
//  PPApplyViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/11.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPApplyViewController.h"
#import "PPApplyTableViewCell.h"
#import "PPTextView.h"

@interface PPApplyViewController ()<TZImagePickerControllerDelegate>
@property (nonatomic, strong)NSArray *arr;
@property (nonatomic, strong)UIImage *logoImage;
@property (nonatomic,strong)UIImage *liceImeg;
@property (nonatomic, strong)NSString *logoImageUrl;
@property (nonatomic,strong)UIImage *liceImegUrl;
@property (nonatomic, strong)NSString *groupName; //团体名称
@property (nonatomic, strong)NSString *connectName;//联系人姓名
@property (nonatomic, strong)NSString *connectPhone; //联系人电话
@property (nonatomic, strong)NSString *groupPhone; //企业电话
@property (nonatomic, strong)NSString *groupAddress; // 企业地址

@end

@implementation PPApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView.tableHeaderView = self.mainHeaderView;
    self.titleLabel.text = [NSString stringWithFormat:@"%@申请",self.typeName];
    if ([self.typeName isEqualToString:@"企业红娘"]) {
        self.arr = @[@"企业名称",@"联系人姓名",@"联系人电话",@"企业电话",@"企业地址"];
    } else if ([self.typeName isEqualToString:@"团体红娘"]) {
         self.arr = @[@"团体名称",@"联系人姓名",@"联系人电话",@"团体地址"];
    }else {
        self.arr = @[@"高校名称",@"联系人姓名",@"联系人电话",@"高校地址"];
    }
    [self initFooterView];
}
-(void)initFooterView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenw, 108*kHeight)];
    UIButton *applyBtn = [[UIButton alloc] initWithFrame:CGRectMake(20*kWidth, 30*kHeight, kScreenw - 40*kWidth, 58*kHeight)];
    [applyBtn setImage:[UIImage imageNamed:@"apply_gropu"] forState:(UIControlStateNormal)];
    [view addSubview:applyBtn];
    [applyBtn addTarget:self action:@selector(applyBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    self.mainTableView.tableFooterView = view;
}
-(void)applyBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.arr.count;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.typeName isEqualToString:@"企业红娘"] ? 3: 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PPApplyTableViewCell *cell = [[PPApplyTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPApplyTableViewCellID"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PPApplyTableViewCellID" forIndexPath:indexPath];
        }
        @weakify(self);
        cell.nameBlock = ^(NSString * _Nonnull name) {
            if ([weak_self.groupName isEqualToString:@"企业红娘"]) {
                if (indexPath.row == 0) {
                    weak_self.groupName = name;
                }
            }
        };
        cell.inputView.placeHolder = self.arr[indexPath.row];
        return cell;
    }
    if (indexPath.section == 1 && [self.typeName isEqualToString:@"企业红娘"]) {
        PPApplyPhotoTableViewCell *cell = [[PPApplyPhotoTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPApplyPhotoTableViewCellID"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PPApplyPhotoTableViewCellID" forIndexPath:indexPath];
        }
        if (self.liceImeg) {
            cell.icon.image = self.liceImeg;
        } else {
            cell.icon.image = [UIImage imageNamed:@"company_lice"];
        }
        cell.titleLabel.text = @"企业执照";
        cell.selectBlock = ^{
            [self openPhoto:NO];
        };
        return cell;
    }
    if (indexPath.section == 2 && [self.typeName isEqualToString:@"企业红娘"]) {
        PPApplyLogoTableViewCell *cell = [[PPApplyLogoTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPApplyLogoTableViewCellID"];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"PPApplyLogoTableViewCellID" forIndexPath:indexPath];
        }
        cell.titleLabel.text = @"企业LOGO";
        if (self.logoImage) {
            cell.logo.image = self.logoImage;
        } else {
            cell.logo.image = [UIImage imageNamed:@"company_logo"];
        }
        cell.logoBlock = ^{
            [self openPhoto:YES];
        };
        return cell;
    }
    PPApplyLogoTableViewCell *cell = [[PPApplyLogoTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"PPApplyLogoTableViewCellID"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"PPApplyLogoTableViewCellID" forIndexPath:indexPath];
    }
    cell.titleLabel.text = [self.typeName isEqualToString:@"高校红娘"] ? @"高校LOGO" : @"团体LOGO";
    if (self.logoImage) {
        cell.logo.image = self.logoImage;
    } else {
        cell.logo.image = [self.typeName isEqualToString:@"高校红娘"] ? [UIImage imageNamed:@"school_logo"] : [UIImage imageNamed:@"group_logo"];
    }
    cell.logoBlock = ^{
        [self openPhoto:YES];
    };
    return cell;
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 50*kHeight;
    }
    return UITableViewAutomaticDimension;
}
-(void)openPhoto:(BOOL)isLogo {
    TZImagePickerController *pickVC = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    pickVC.view.tag = isLogo ? 1000 : 2000;
    [self presentViewController:pickVC animated:YES completion:nil];
}
-(void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    if (picker.view.tag == 1000) {
        self.logoImage = photos.firstObject;
    } else {
        self.liceImeg = photos.firstObject;
    }
    NSMutableDictionary *ddd = [[NSMutableDictionary alloc]init];
    [ddd setObject:photos forKey:@"logo"];
    [[PPNetTool share] upLoadImagWithUrl:UpdatePhoto_url parm:ddd name:@"logo" images:photos fileNames:@[@"logo"] showView:nil success:^(id response) {
        NSLog(@"%@",response);
        if (picker.view.tag == 1000) {
            self.logoImageUrl = response[@"data"][@"logo"];
        } else {
            self.liceImeg = response[@"data"][@"logo"];
        }
    }];
    [self.mainTableView reloadData];
}


@end
