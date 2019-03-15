//
//  PPSearchGroupTableViewCell.h
//  pengpeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PPSearchGroupModel;

typedef void(^btnStatusBlock)(NSString *ID);
@interface PPSearchGroupTableViewCell : UITableViewCell
@property (nonatomic,strong) PPSearchGroupModel *searchmodel;
@property (nonatomic,copy) btnStatusBlock btnStatusBlock;
@property (nonatomic,strong) UIButton *btnStatus;
@end

@interface PPSearchGroupDefaultTableViewCell : UITableViewCell

@end


