//
//  PPCustomNav.m
//  pengpeng
//
//  Created by wang on 2019/3/10.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPCustomNav.h"

@implementation PPCustomNav

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLable = [[UILabel alloc] init];
        self.titleLable.textColor = [UIColor blackColor];
        self.titleLable.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.titleLable];
        [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(15);
            make.top.offset(STATUS_BAR_HEIGHT);
            make.height.mas_equalTo(self.height - STATUS_BAR_HEIGHT);
        }];
    }
    return self;
}

@end
