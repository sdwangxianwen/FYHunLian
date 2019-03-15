//
//  PPBaseViewController.h
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPUserPermissionsModel.h" //用户权限
@class PPCustomNav;
NS_ASSUME_NONNULL_BEGIN

@interface PPBaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)UIView *mainHeaderView;
@property (nonatomic, strong)UIButton *leftBtn;
@property (nonatomic, strong)UIButton *rightBtn;
@property (nonatomic,assign)BOOL isRefresh; //是否有刷新
@property (nonatomic, strong)PPCustomNav *customNav;
/**
 用户权限的模型
 */
@property (nonatomic, strong)PPUserPermissionsModel *permissionsModel;
-(void)dropdownRefresh;//下拉刷新
-(void)pullLoading; //上拉加载
-(void)initRightBtn; //创建右
-(void)rightBtnClick;//右键的点击事件
/**
 标题
 */
@property (nonatomic, strong)UILabel *titleLabel;
/**
 创建标题
 */
-(void)initTitleLabel;
/**
 获取用户权限
 */
-(void)getUserpermissions;



@end

NS_ASSUME_NONNULL_END
