//
//  PPCharacterView.h
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN
typedef void(^complete)(NSArray *arr);
@interface PPCharacterView : UIView
-(instancetype)initWithFrame:(CGRect)frame type:(NSString *)type ;
@property (nonatomic,copy)complete complete;
+(void)showWith:(NSString *)type completion:(complete)completion; //1性格2爱好
+(void)disMiss;
@end

@class PPChartModel;
@interface PPChartCell : UITableViewCell
@property (nonatomic, strong)PPChartModel *model;
@end

NS_ASSUME_NONNULL_END
