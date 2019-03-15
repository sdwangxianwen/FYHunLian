//
//  PPEmptyView.h
//  PengPeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 pengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPEmptyView : UIView
-(instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title;

@property (nonatomic, strong)UILabel *titlelabel;
@property (nonatomic, strong)UIImageView *icon;



+(void)showEmptyWithTitle:(NSString *)title imageName:(NSString *)imageName view:(UIView *)view;
+(void)dismiss;
@end

NS_ASSUME_NONNULL_END
