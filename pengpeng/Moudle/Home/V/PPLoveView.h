//
//  PPLoveView.h
//  pengpeng
//
//  Created by wang on 2019/3/9.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^btnClickBlock)(NSInteger tag);

@interface PPLoveView : UIView
@property (nonatomic, strong)UIButton *sendGiftBtn;
@property (nonatomic, strong)UIButton *loveBtn;
@property (nonatomic, strong)UIButton *chatBtn;
@property (nonatomic,copy)btnClickBlock btnClickBlock;
@property (nonatomic, strong)NSString *likeUserID; //喜欢的人的id
@property (nonatomic, strong)NSString *likeStatus; //喜欢的状态 1喜欢0取消喜欢

@end

NS_ASSUME_NONNULL_END
