//
//  PPInputTableViewCell.h
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PPTextView;

NS_ASSUME_NONNULL_BEGIN
typedef void(^nameBlock)(NSString *name);
typedef void(^sexBlock)(NSInteger sex);
@interface PPInputTableViewCell : UITableViewCell
@property (nonatomic, strong)PPTextView *inputView;
@property (nonatomic, strong)UIButton *manBbtn;
@property (nonatomic, strong)UIButton *womanBtn;
@property (nonatomic, strong)UIImageView *arrowImageview;
@property (nonatomic, strong)YYTextView *tagView;
@property (nonatomic, strong)NSString *indexRow;
@property (nonatomic,copy)nameBlock nameBlock;
@property (nonatomic,copy)sexBlock sexBlock;
-(void)showTag;

@end

NS_ASSUME_NONNULL_END
