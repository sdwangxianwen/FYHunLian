//
//  PPArgument.h
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#ifndef PPArgument_h
#define PPArgument_h

#define kScreenw [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kWidth  kScreenw/375.0
#define kHeight kScreenH/667.0
//特殊字符
#define SpecialCharacters @"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""
#define WeakSelf  __weak __typeof(&*self)weakSelf = self;
//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
// 是否是iPhoneX
// 判断是否为iPhone X 系列  这样写消除了在Xcode10上的警告。
#define IPHONE_X \
({BOOL IPHONE_X = NO;\
if (@available(iOS 11.0, *)) {\
IPHONE_X = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(IPHONE_X);})

// 顶部区域
#define NavBarHight (IPHONE_X ? 88 : 64)
// 状态栏高度
#define STATUS_BAR_HEIGHT (IPHONE_X ? 44.f : 20.f)
// tabBar高度
#define TAB_BAR_HEIGHT (IPHONE_X ? (49.f+34.f) : 49.f)
#define HOME_INDICATOR_HEIGHT   (IPHONE_X ?34.f: 0.f)
//我的队伍的头部视图的高度
#define TEAM_HEADER_HEIGHT 263*kHeight

#define USERID @"userid"
#define USERTOKEN @"userToken"
#define RCIMTOKEN @"rcimToken"

#endif /* PPArgument_h */
