//
//  PPApplyTableViewCell.h
//  pengpeng
//
//  Created by wang on 2019/3/11.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PPTextView;
NS_ASSUME_NONNULL_BEGIN
typedef void(^nameBlock)(NSString *name);
@interface PPApplyTableViewCell : UITableViewCell
@property (nonatomic,copy)nameBlock nameBlock;
@property (nonatomic, strong)PPTextView *inputView;
@end

typedef void(^selectBlock)(void);
@interface PPApplyPhotoTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *icon;

@property (nonatomic,copy)selectBlock selectBlock;
@end

typedef void(^logoBlock)(void);
@interface PPApplyLogoTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *logo;
@property (nonatomic,copy)logoBlock logoBlock;
@end

NS_ASSUME_NONNULL_END
