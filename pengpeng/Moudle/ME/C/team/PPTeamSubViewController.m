//
//  PPTeamSubViewController.m
//  pengpeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPTeamSubViewController.h"
#import "PPTeamModel.h"
#import "PPTeamMemberCollectionViewCell.h"
#import "PPCustomNav.h"

static NSString *const PPTeamMemberCollectionViewCellID = @"PPTeamMemberCollectionViewCellID";

@interface PPTeamSubViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView *mainCollectionView;
@property (nonatomic, strong)NSArray *memberArr;
@property (nonatomic,assign)CGFloat lastcontentOffset;


@end

@implementation PPTeamSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorRandom];
    [self netWorking];
}

-(void)netWorking {
    NSDictionary *par = @{};
    NSString *url = @"";
    if (self.type == PPTeamTypeGroupManager || self.type == PPTeamTypeGroupMember ) {
        par = @{@"groupId" : self.teamID,
                 @"type" : self.teamType,
                 @"pageNum" : @"1"
                 };
        url = GroupRanksUserByGroupId;
    } else {
        par = @{@"matchmakerUserId" : self.teamID,
                 @"type" : self.teamType,
                 @"pageNum" : @"1"
                 };
        url = TroopInfo_url;
    }
   
    [[PPNetTool share] get:url parm:par modelClass:[PPTeamMemberModel class] isCache:YES isShowLoadHUD:YES isShowErrorHUD:YES success:^(NSArray *response) {
        self.memberArr = response;
        [self.mainCollectionView reloadData];
    }];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PPTeamMemberCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PPTeamMemberCollectionViewCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorRandom];
    cell.memberModel = self.memberArr[indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
     return self.memberArr.count;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    PPTeamMemberModel *model = self.memberArr[indexPath.row];
    if (self.delegate && [self.delegate respondsToSelector:@selector(seeMemberInfo:)]) {
        [self.delegate seeMemberInfo:model.userId];
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat headerY = 0;
    
//    CGFloat hight = scrollView.frame.size.height;
//    CGFloat contentOffset = scrollView.contentOffset.y;
//    CGFloat distanceFromBottom = scrollView.contentSize.height - contentOffset;
//    CGFloat offset = contentOffset - self.lastcontentOffset;
//    self.lastcontentOffset = contentOffset;
//    if (offset > 0 && contentOffset > 0) {
//        NSLog(@"上拉行为");
////        headerY = MAX(-offsetY, -TEAM_HEADER_HEIGHT);
////        headerY = -offset;
//        headerY = MAX(-offsetY, -TEAM_HEADER_HEIGHT + NavBarHight);
//    }
//    if (offset < 0 && distanceFromBottom > hight) {
//        NSLog(@"下拉行为");
//         headerY = 0;
//    }
//    if (contentOffset == 0) {
//        NSLog(@"滑动到顶部");
////        headerY =  -TEAM_HEADER_HEIGHT;
//    }
//    if (distanceFromBottom < hight) {
//        NSLog(@"滑动到底部");
//    }
    
    
    if (offsetY > 0) {
        headerY = MAX(-offsetY, -TEAM_HEADER_HEIGHT + NavBarHight);
    }else {
       
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(scorllHeight:)]) {
        [self.delegate scorllHeight:headerY];
    }
    
   
}

-(UICollectionView *)mainCollectionView {
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(kScreenw/3, kScreenw/3);
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        _mainCollectionView.backgroundColor = [UIColor whiteColor];
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
        _mainCollectionView.showsVerticalScrollIndicator = NO;
        _mainCollectionView.alwaysBounceVertical = YES;
        [_mainCollectionView registerClass:[PPTeamMemberCollectionViewCell class] forCellWithReuseIdentifier:PPTeamMemberCollectionViewCellID];
        [self.view addSubview:_mainCollectionView];
        [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
    }
    return _mainCollectionView;
}


- (UIView *)listView {
    return self.view;
}

- (void)listDidAppear {
    
}

- (void)listDidDisappear {}




@end
