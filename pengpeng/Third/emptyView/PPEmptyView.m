//
//  PPEmptyView.m
//  PengPeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 pengpeng. All rights reserved.
//

#import "PPEmptyView.h"


@implementation PPEmptyView

-(instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI {
    _icon = [[UIImageView alloc] init];
    [self addSubview:_icon];
    _icon.layer.cornerRadius = 21;
    _icon.clipsToBounds = YES;
//    _icon.image = [UIImage imageNamed:@"lahei_empty"];
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_centerY).offset(-105);
        make.size.mas_equalTo(CGSizeMake(105, 105));
    }];
    
    _titlelabel  = [[UILabel alloc] init];
    [self addSubview:_titlelabel];
    _titlelabel.textColor = [UIColor colorWithHex:0xa2a2a2];
    _titlelabel.font = [UIFont systemFontOfSize:13];
//    _titlelabel.text = @"暂无黑名单用户";
    _titlelabel.textAlignment = NSTextAlignmentCenter;
    [_titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.icon.mas_bottom).offset(48);
    }];
}
+(void)showEmptyWithTitle:(NSString *)title imageName:(NSString *)imageName view:(UIView *)view {
    PPEmptyView *emptyView = [[PPEmptyView alloc] initWithFrame:view.bounds imageName:imageName title:title];
    emptyView.titlelabel.text = title;
    emptyView.icon.image = [UIImage imageNamed:imageName];
    [view addSubview:emptyView];
}
+(PPEmptyView *)getEmptyView {
    NSEnumerator *subviewsEnum = [[UIApplication sharedApplication].keyWindow.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            PPEmptyView *emptyView = (PPEmptyView *)subview;
            return emptyView;
        }
    }
    return nil;
}
+(void)dismiss {
    [[self getEmptyView] removeFromSuperview];
}
@end
