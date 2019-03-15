//
//  PPEditTableViewCell.h
//  pengpeng
//
//  Created by wang on 2019/3/10.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PPEditModel;
@class PPLoveModel;
NS_ASSUME_NONNULL_BEGIN

@interface PPEditPhotoCell : UITableViewCell<TZImagePickerControllerDelegate>
@property (nonatomic,strong)UIButton *zeroImageBtn;
@property (nonatomic, strong)UIButton *oneImageBtn;
@property (nonatomic, strong)UIButton *twoImageBtn;
@property (nonatomic, strong)UIButton *threeImageBtn;
@property (nonatomic, strong)UIButton *fourImageBtn;
@property (nonatomic, strong)UIButton *fiveImageBtn;

@end

@interface PPEditNameCell : UITableViewCell
@property (nonatomic, strong)UILabel *subTitleLabel;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *ageLabel;
@property (nonatomic, strong)UIImageView *sexImageView;
@property (nonatomic, strong)UIImageView *editImageView;
@end

@interface PPEditSectionView : UITableViewHeaderFooterView
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)PPEditModel *model;
@end

@interface PPEditTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel *subTitleLabel;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)PPEditModel *model;
@end

@interface ppeditLoveCell : UITableViewCell
@property (nonatomic, strong)UILabel *subTitleLabel;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)PPLoveModel *model;
@end

NS_ASSUME_NONNULL_END
