//
//  PPMeDetailTableViewCell.h
//  pengpeng
//
//  Created by wang on 2019/3/8.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPMeDetailModel.h"
//MARK:只有一个标题和副标题的cell
@interface PPMeDetailTitleCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *subTitleLabel;
@property (nonatomic, strong)PPMeDetailSectionModel *model;
@property (nonatomic, strong)PPMeDetailModel *detailModel;
@end

@interface PPMeDetailTableViewCell : UITableViewCell
@property (nonatomic, strong)PPMeDetailModel *detailModel;
@end

@interface PPMeDetailSectionView : UITableViewHeaderFooterView
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)PPMeDetailSectionModel *model;
@end

//聊聊爱情的cell
@interface PPMeDeatilQasCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *subTitleLabel;
@property (nonatomic, strong)zxQuestionModel *quesModel;
@end

//只显示标签的cell
//#import "PPTagView.h"
#import "XWTagView.h"
@interface PPMeDeatilTagCell : UITableViewCell
@property (nonatomic, strong) XWTagView*tagView;
@property (nonatomic, strong)zxUserHobbyModel *hobbyModel; //爱好
@property (nonatomic, strong)zxUserCharacterModel *chartModel; //性格
@end

@interface PPMeDetailIconCell : UITableViewCell
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *subTitleLabel;
@property (nonatomic, strong)UIImageView *arrowImageView;
@property (nonatomic, strong)PPMeDetailModel *model;
@end
