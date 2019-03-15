//
//  PPLoveTableViewCell.h
//  pengpeng
//
//  Created by wang on 2019/3/14.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPLoveListModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface PPLoveTableViewCell : UITableViewCell
@property (nonatomic,strong) UIImageView *header;
@property (nonatomic,strong) UILabel *NameLabel;
@property (nonatomic,strong) UIImageView *sexImage;
@property (nonatomic,strong) UILabel *ageLabel;
@property (nonatomic, strong)UIImageView *identityImageView;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,copy)PPLoveListModel *listModel;
@end

NS_ASSUME_NONNULL_END
