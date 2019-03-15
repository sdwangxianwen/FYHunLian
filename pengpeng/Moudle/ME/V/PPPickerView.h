//
//  PPPickerView.h
//  PengPeng
//
//  Created by edz on 2018/12/11.
//  Copyright © 2018年 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,PPPickerViewType){
    
    PPPickerViewTypeBirthday,        //出生日期
    PPPickerViewTypeSex,             //性别
    PPPickerViewTypeMaritalStatus,   //婚姻状况
    PPPickerViewTypeHaveChild,       //生活状况
    PPPickerViewTypeBloodType,       //血型
    PPPickerViewTypeHeight,          //身高
    PPPickerViewTypeWeight,          //体重
    PPPickerViewTypeRegister,        //户口
    PPPickerViewTypeNowAddress,      //现居住地
    PPPickerViewTypeIndustry,        //行业
    PPPickerViewTypePosition,        //职位
    PPPickerViewTypeIncome,          //收入
    PPPickerViewTypeEducation,       //学历
    PPPickerViewTypeStatus,          //现状
    PPPickerViewTypeHaveCar,         //是否有车
    PPPickerViewTypeHaveHouse,       //是否有房
    PPPickerViewTypeRange,         //区间范围，比如筛选
    
};

@protocol PPPickerViewResultDelegate <NSObject>

@optional
-(void)pickerView:(UIView *)pickerView result:(id)result;

@end


@interface PPPickerView : UIView <UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) UIPickerView *picker;

@property (nonatomic,strong) UIDatePicker *datePicker;

@property (nonatomic,assign) PPPickerViewType type;

@property (nonatomic,strong) NSMutableArray *array;


//默认选中第一列
@property (nonatomic,assign) NSInteger selectComponent;


@property (nonatomic,weak) id <PPPickerViewResultDelegate>delegate;


@property (nonatomic,copy) NSString *IndustryID; // 行业id

// 点击了pickView的遮罩
- (void)pickViewClickMaskHandler:(void(^)(void))handler;
@end

NS_ASSUME_NONNULL_END
