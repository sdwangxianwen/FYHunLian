//
//  PPTeamMemberCollectionViewCell.h
//  pengpeng
//
//  Created by wang on 2019/3/13.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class PPTeamMemberModel;
@interface PPTeamMemberCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)PPTeamMemberModel *memberModel;
@end

NS_ASSUME_NONNULL_END
