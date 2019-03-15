//
//  PPEditAlertView.h
//  pengpeng
//
//  Created by wang on 2019/3/11.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,PPAlertType) {
    PPAlertTypeInput, //可以填写输入框的
    PPAlertTypeTwoBtn ,//2个按钮的
    PPAlertTypeOneBtn, //一个按钮的
    PPAlertTypeImage, //带有图片的
};
typedef void(^sureBlock)(void);
typedef void(^cancleBlock)(void);

NS_ASSUME_NONNULL_BEGIN
typedef void(^editBlock)(NSString *);
@interface PPEditAlertView : UIView

-(instancetype)initWithFrame:(CGRect)frame
                       title:(NSString *)title
                        type:(PPAlertType)type;
-(instancetype)initWithFrame:(CGRect)frame
                       title:(NSString *)title
                        type:(PPAlertType)type
                        sure:(NSString *)sure
                      cancle:(NSString *)cancle;
@property (nonatomic,assign)PPAlertType type;
@property (nonatomic,copy)editBlock editBlock;
@property (nonatomic,copy)sureBlock sureBlock;
@property (nonatomic,copy)cancleBlock cancleBlock;
+(void)show:(NSString *)title type:(PPAlertType)type complete:(editBlock)complete;
+(void)showTitle:(NSString *)title
      sureString:(NSString *)sureString
        sureBlock:(sureBlock)sureBlock
           cancle:(NSString *)cancleString
      cancleBlock:(cancleBlock)cancleBlock;
+(void)disMiss;
@end

NS_ASSUME_NONNULL_END
